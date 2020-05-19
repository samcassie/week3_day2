require('pg')

class House

    attr_reader :id
    attr_accessor :address, :value, :number_of_bedrooms, :build

    def initialize(options)
        @id = options['id'] if options['id']
        @address = options['address']
        @value = options['value'].to_i()
        @number_of_bedrooms = options['number_of_bedrooms'].to_i()
        @build = options['build']
    end

    def save()
        db = PG.connect( { dbname: 'houses', host: 'localhost'})
        sql = "INSERT INTO houses
               (address, value, number_of_bedrooms, build)
               VALUES
               ($1, $2, $3, $4)
               RETURNING id"
        values = [@address, @value, @number_of_bedrooms, @build]
        db.prepare("save", sql)

        pg_result = db.exec_prepared("save", values)
        @id = pg_result[0]["id"].to_i()

        db.close()
    end

    def update()
        db = PG.connect( { dbname: 'houses', host: 'localhost'})
        sql = "UPDATE houses SET
               (address, value, number_of_bedrooms, build)
               =
               ($1, $2, $3, $4)
               WHERE id = $5"
        values = [@address, @value, @number_of_bedrooms, @build, @id]
        db.prepare("update", sql)

        db.exec_prepared("update", values)

        db.close()
    end

    def delete()
        db = PG.connect( { dbname: 'houses', host: 'localhost'})
        sql = "DELETE FROM houses WHERE id = $1"
        values = [@id]
        db.prepare("delete", sql)

        db.exec_prepared("delete", values)

        db.close()
    end

    def House.all()
        db = PG.connect( { dbname: 'houses', host: 'localhost'})
        sql = "SELECT * FROM houses"
        db.prepare("all", sql)
        properties_db_result = db.exec_prepared("all")
        db.close()
        properties = properties_db_result.map {|property_hash| House.new(property_hash)}
        return properties
    end

    # def House.find(input)
    #     db = PG.connect( { dbname: 'houses', host: 'localhost'})
    #
    #     \set search = input
    #     sql = "SELECT * FROM houses WHERE address = search"
    #
    #     db.prepare("find", sql)
    #     found_db_result = db.exec_prepared("find")
    #     db.close()
    #
    #
    # 
    # end

end
