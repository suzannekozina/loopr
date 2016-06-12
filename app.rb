require 'json'

  def setup_files
  	path = File.join(File.dirname(__FILE__), 'data.json')
  	file = File.read(path)
    $collection_hash = JSON.parse(file)
  	$report_file = File.new("report.txt", "w+")
  end

  def category_list
    puts"*********LIST COLLECTION CATEGORIES*********"
    $collection_hash["collection"].each do |category|
  		puts category["category"]
    end
  	puts "********************************************"
    puts "Total number of categories in collection: #{$collection_hash["collection"].length}"
  	puts "============================================
    "
  end


def objective_list
  puts "*********LIST COLLECTION OBJECTIVES*********"
  total_objectives = 0
  $collection_hash["collection"].each do |lobjectives|
    puts "Category: #{lobjectives["category"]}"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    lobjectives["lobjectives"]
      lobjectives["lobjectives"].each do |objective|
        puts objective["objective"]
        total_objectives += 1
      end
    puts "********************************************
    "
  end
  puts "Total number of objectives in collection: #{total_objectives}"
  puts "============================================================="
end


  setup_files
  category_list
  objective_list

# PRINT REPORTS TO REPORT.TXT
# ------------------------
f = File.open("report.txt", "w")
old_out = $stdout
$stdout = f
puts category_list
puts objective_list
f.close

$stdout = old_out
puts "goodbye"
