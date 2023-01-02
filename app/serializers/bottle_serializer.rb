class BottleSerializer < ActiveModel::Serializer
  attributes :id, :title, :wine_type, :grape_variety, :vintage

  belongs_to :user
  belongs_to :winery

  def winery
    object.winery
  end
end
