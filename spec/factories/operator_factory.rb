# == Schema Information
#
# Table name: current_operators
#
#  id                                 :integer          not null, primary key
#  name                               :string
#  tags                               :hstore
#  created_at                         :datetime
#  updated_at                         :datetime
#  onestop_id                         :string
#  geometry                           :geography({:srid geometry, 4326
#  created_or_updated_in_changeset_id :integer
#  version                            :integer
#  identifiers                        :string           is an Array
#
# Indexes
#
#  #c_operators_cu_in_changeset_id_index   (created_or_updated_in_changeset_id)
#  index_current_operators_on_identifiers  (identifiers)
#  index_current_operators_on_onestop_id   (onestop_id) UNIQUE
#

FactoryGirl.define do
  factory :operator do
    onestop_id { Faker::OnestopId.operator }
    name { FFaker::Company.name }
    geometry { "POINT(#{rand(-124.4..-90.1)} #{rand(28.1..50.0095)})" }
  end
end