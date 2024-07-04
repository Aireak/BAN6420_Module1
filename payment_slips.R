#insatll necessary packages
install.packages("stringi")

# Load necessary libraries
library(stringi)

# Function to generate random factory worker names
develope_names <- function() {
  return(stri_rand_strings(1, 7, pattern = "[A-Z]"))
}

# Create a list of at least 421 factory workers
factory_workers <- list()
for (i in 1:421) {
  factory_worker <- list(
    staff_id = i,
    staff_name = develope_names(),
    salary = sample(5500:35500, 1),
    gender = sample(c("Male", "Female"), 1)
  )
  factory_workers[[i]] <- factory_worker
}

# Generate worker payment slips
for (factory_worker in factory_workers) {
  tryCatch({
    Staff_id <- factory_worker$staff_id
    Staff_Name <- factory_worker$staff_name
    Salary <- factory_worker$salary
    Gender <- factory_worker$gender
    Employee_Level <- "L1" # This is a default level
    
    if (10000 < Salary && Salary < 20000) {
      Employee_Level <- "A1"
    }
    if (7500 < Salary && Salary < 30000 && Gender == "Female") {
      Employee_Level <- "A5-F"
    }
    
    cat(sprintf("Payment Slip for Factory Staff ID: %d, Staff Name: %s, Staff Salary: $%d, Gender: %s, Staff Employee Level: %s\n",
                Staff_id, Staff_Name, Salary, Gender, Employee_Level))
  }, error = function(e) {
    cat(sprintf("An error occurred while processing Staff ID: %d. Error: %s\n", Staff_id, e$message))
  })
}