# == Schema Information
#
# Table name: current_stops
#
#  id                                 :integer          not null, primary key
#  onestop_id                         :string
#  geometry                           :geography({:srid geometry, 4326
#  tags                               :hstore
#  created_at                         :datetime
#  updated_at                         :datetime
#  name                               :string
#  created_or_updated_in_changeset_id :integer
#  version                            :integer
#  identifiers                        :string           is an Array
#
# Indexes
#
#  #c_stops_cu_in_changeset_id_index   (created_or_updated_in_changeset_id)
#  index_current_stops_on_identifiers  (identifiers)
#  index_current_stops_on_onestop_id   (onestop_id)
#

FactoryGirl.define do
  factory :stop do
    onestop_id { Faker::OnestopId.stop }
    geometry { "POINT(#{rand(-124.4096..-114.1308)} #{rand(32.5343..42.0095)})" }
    name { [
      'C. Chavez St & Florida St',
      'Metro Embarcadero Station',
      'West Portal/Sloat/St Francis Circle'
    ].sample }
    version 1
    association :created_or_updated_in_changeset, factory: :changeset
  end
end