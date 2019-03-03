##  Let's Build a Simple Data

This is code I am writing as a follow along with https://cstack.github.io/db_tutorial/


I am trying to write the code in Haskell

to run the code in GHCi,  cd into the code directory and run
```
docker pull haskell  # unless you already has pulled haskell
docker run -it --rm -v $PWD:/work -w /work haskell
```

this will start the GHCi repl.  you should see a prompt similar to
```
GHCi, version 8.6.3: http://www.haskell.org/ghc/  :? for help
```

load the code
```
Prelude> :l sqlite
[1 of 1] Compiling Main             ( sqlite.hs, interpreted )
Ok, one module loaded.
```

start the `sqlite` repl
```
*Main> main
db > .tables
Unrecognized command '.tables'
db > .ext
Unrecognized command '.ext'
db > .exit
```

to leave the GHCi repl,  use ^d
```
Leaving GHCi.
```

to compile the code to an executable, run
```
docker run -it --rm -v $PWD:/work -w /work haskell ghc -o sqlite sqlite.hs

```
(This works on linux. For another OS,  ymmv)
