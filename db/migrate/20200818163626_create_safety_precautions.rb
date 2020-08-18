class CreateSafetyPrecautions < ActiveRecord::Migration[5.2]
  def change
    create_table :safety_precautions do |t|
      t.string :cleaning_sanitizing
      t.string :social_distancing
      t.string :ppe #personal_protective_equipment
    end
  end
end
