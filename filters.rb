# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # NOTE: Can't do .each - .each ALWAYS returns the original array. It will NOT return anything else.
  
  @candidates.find { |candidate| candidate[:id] == id.to_i }

end


def experienced?(candidate)

  candidate[:years_of_experience] >= 2

  # Same as:
  # if candidate[:years_of_experience] >= 2
  #   true
  # else
  #   false
  # end

end

def qualified_candidates(candidates)

  #Know at least Ruby or Python
  #Applied in the last 15 days - need to see if the date in the hash is >= a date 15 days ago.
  #Are over the age of 17 (18+)
  # candidate[:github_points] > 100 

  candidates.find_all { |candidate| experienced?(candidate) && candidate[:github_points] > 100 && (candidate[:languages].find { |word| word == "Ruby" } || candidate[:languages].find { |word| word == "Python" }) && candidate[:age] > 17 && candidate[:date_applied] >= 15.days.ago.to_date }

end

def ordered_by_qualifications(candidates)
  # Candidates with the most experience are at the top
  # For Candidates that have the same years of experience, they are further sorted by their number of Github points (highest first)

  candidates.sort_by {|candidate| [candidate[:years_of_experience], -candidate[:github_points]] }

end


