require "set"

module BookKeeping
  VERSION = 1
end

class School
  def initialize
    @hashmap = {}
  end

  def add person, grade
    @hashmap[grade] ||= ::Set.new
    @hashmap[grade] << person
    @hashmap[grade] = @hashmap[grade].sort
  end

  def students grade
    @hashmap[grade] ? @hashmap[grade].to_a : []
  end

  def students_by_grade
    return [] if @hashmap.empty?

    @hashmap.sort.map { |key, value| { grade: key, students: value } }
  end
end
