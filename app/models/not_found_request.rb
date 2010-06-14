class NotFoundRequest < ActiveRecord::Base
  before_save :increment_count_created
  validates_uniqueness_of :url

  def self.reset_at
    Time.zone.parse(Radiant::Config['nostalgia.not_found_reset_at'])
  end
  
  def self.reset_at=(time)
    Radiant::Config['nostalgia.not_found_reset_at'] = time
  end

  private

  def increment_count_created
    if !self[:count_created].blank?
      self.count_created = self[:count_created] + 1
    else
      self.count_created = 1 if self.new_record?
    end
  end
end
