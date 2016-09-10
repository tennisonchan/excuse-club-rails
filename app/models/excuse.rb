class Excuse < ApplicationRecord
  def start_time=(val)
    self.start_at = Time.zone.at(val.to_i)
  end

  def end_time=(val)
    self.end_at = Time.zone.at(val.to_i)
  end
end
