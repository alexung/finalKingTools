class Product < ActiveRecord::Base
    validates_presence_of :name

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        product = find_by_id(row["id"]) || new
        product.attributes = row.to_hash
        product.save!
      end
    end

    def self.search(search)
      # if search
      #   # binding.pry
      #   Product.find(['name LIKE ?', '%#{search}%'])
      # else
      #   Product.all
      # end
      where("name LIKE ?", "%#{search}%")
    end


end
