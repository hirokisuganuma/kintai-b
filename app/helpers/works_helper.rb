module WorksHelper

  def current_time
    Time.new(
      Time.now.year,
      Time.now.month,
      Time.now.day,
      Time.now.hour,
      Time.now.min, 0
    )
  end

  def working_times(started_at, finished_at)
    format("%.2f", (((finished_at - started_at) / 60) / 60.0))
  end

  def working_times_sum(seconds)
    format("%.2f", seconds / 60 / 60.0)
  end
  
  def works_invalid?
    works = true
    works_params.each do |id, item|
      if item[:attendance_time].blank? && item[:leaving_time].blank?
        next
      elsif item[:attendance_time].blank? || item[:leaving_time].blank?
        works = false
        break
      elsif item[:attendance_time] > item[:leaving_time]
        works = false
        break
      end
    end
    return works
  end
end
