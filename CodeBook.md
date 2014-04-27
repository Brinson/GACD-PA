CodeBook
========================================================
#### Load Data
- Assign Each Item to a Variable using the read.table function.
#### Process Data
- RBind the test and the training data to create one dataset for each x, y and labels.
- Add Activity Labels to the Y Dataset by joining the id 1 through 6 to its label.
- Title Columns Based on Features File.
#### Merge Data
- Column Bind the DataSets together to take advantage of ordering. 
- Rename the ID and Subject columns as existing titles might be ambiguous. 

### Subset Data
#### Find All Means and Standard Deviations
- Use RegEx grep to find Mean, assign to variable.
- Use Regex grep to Find std, assign to variable.
- Subset using the grep results.

#### Load Data into DataTable.
- Create Means for Each Subject and Activity.
- Order by Subject.
- Write to File.