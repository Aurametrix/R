# example John a11|a12|\n  Ana a21|a22|\n  Jake a31|a23|\n   
# need to separate by special symbol |
# use strsplit(string, "symbol") with the split regular expression "[\\||\n] *"
strsplit(x, split="[\\||\n] *")[[1]]

# The grep function takes your regex as the first argument, and the input vector as the second argument
# The grepl function takes the same arguments as the grep function, except for the value argument, 
grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE)
grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)

sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE,fixed = FALSE, useBytes = FALSE)

gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE,
     fixed = FALSE, useBytes = FALSE)

regexpr(pattern, text, ignore.case = FALSE, perl = FALSE,
        fixed = FALSE, useBytes = FALSE)

gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE,
         fixed = FALSE, useBytes = FALSE)

regexec(pattern, text, ignore.case = FALSE,
        fixed = FALSE, useBytes = FALSE)

# pattern = character string containing a regular expression
# x, text = a character vector where matches are sought
# perl	 = logical. Should Perl-compatible regexps be used?
