class Excuse < ApplicationRecord
  belongs_to :user
  belongs_to :brother, class_name: 'User'

  def start_time=(val)
    self.start_at = Time.zone.at(val.to_i)
  end

  def end_time=(val)
    self.end_at = Time.zone.at(val.to_i)
  end

  def bro(by:)
    update brother_id: by.id
  end

  def done?
    brother_id.present?
  end
end
