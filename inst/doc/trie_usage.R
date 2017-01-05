## ------------------------------------------------------------------------
  words<-read.delim(
    file=system.file("extdata", "dictionary.txt", package = "rtrie"), 
    header=F, sep = " ",
    stringsAsFactors = FALSE)
  class(words)

## ---- eval=FALSE---------------------------------------------------------
#  trie <- char_tree(words$V1, 'X')

## ------------------------------------------------------------------------
  library(rtrie)
  library(microbenchmark)
  timings <- microbenchmark(
    trie <- char_tree(words$V1, 'X'), 
    times=1
  )
  
  print(paste(timings$time / 1000000000, 'seconds'))

## ------------------------------------------------------------------------
cat(matching_words('stu',trie))

## ------------------------------------------------------------------------
cat(is_word('stunt',trie))

## ------------------------------------------------------------------------
cat(is_word('stu',trie))

