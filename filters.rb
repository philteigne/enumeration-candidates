# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'

  def find(id)
    # Your code Here
    @candidates.each do |candidate|
      if candidate[:id] == id
        return candidate
      end
    end
    return nil
  end
  
  def experienced?(candidate)
    # Your code Here
    if candidate[:years_of_experience] >= 2
      return true
    end

    return false
  end
  
  def qualified_candidates(candidates)
    # Your code Here
    qualified_array = []

    candidates.each do |candidate|
      if experienced?(candidate) && qualify_github(candidate) && qualify_languages(candidate) && qualify_date(candidate) && qualify_age(candidate)
        qualified_array.push(candidate)
      end
    end

    return qualified_array
  end

  def qualify_languages(candidate)
    if candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
      return true
    end

    return false
  end

  def qualify_github(candidate)
    if candidate[:github_points] >= 100
      return true
    end

    return false
  end

  def qualify_date(candidate)
    if (Date.today - candidate[:date_applied]) <= 15
      return true
    end

    return false
  end

  def qualify_age(candidate)
    if candidate[:age] > 17
      return true
    end

    return false
  end
  
  def ordered_by_qualifications(candidates)
    sorted_candidates =  candidates.sort_by do |candidate| 
      [candidate[:years_of_experience], candidate[:github_points]]
    end

    return sorted_candidates.reverse
  end