
df <- read.csv('https://ir.eia.gov/wpsr/table1.csv')
library(tidyverse)
view(df)
options(digits = 9)

data <- select(df, STUB_1, Difference) %>% 
          filter( STUB_1 == 'Crude Oil') %>% 
          rename( Product = STUB_1) %>% 
          mutate( Difference = as.character(Difference)) %>% 
          mutate( Difference = as.numeric(Difference)) %>% 
          mutate( Difference = Difference * 1000000) %>% 
          mutate( Week_ending = as.character(names(df[2]))) %>% 
          mutate( Week_ending = sub('X', '', Week_ending))



data

