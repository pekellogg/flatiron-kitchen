concern :Search do

    included do 
        def self.text_search(query)
            if !query.nil? && !query.empty?
                self.where("name LIKE ?", "%" + self.sanitize_sql_like(query) + "%")
            else
                self.all
            end
        end
    end

end