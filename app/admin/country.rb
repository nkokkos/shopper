ActiveAdmin.register Country do
  action_item do
    link_to "New city", new_admin_country_city_path(country) if action_name == 'show'
  end

  index do
    column :name
    default_actions
  end

  show title: :name do 
    attributes_table do 
      row :name
    end

    panel "City" do
      puts country.inspect
      puts country.cities
      table_for country.cities do
        column "Name" do |city|
          link_to city.name, admin_country_city_path(country, city)
        end
      end
    end
  end
end