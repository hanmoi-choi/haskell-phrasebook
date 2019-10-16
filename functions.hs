vals = (3, 7)

f x = (x, x + 1)

g :: (Num a) => a -> (a, a)
g x = (x+1, x)

-- to show that type signatures are optional 
greetings :: String -> String
greetings name = "hello" ++ " " ++ name

greet name = "hello" ++ " " ++ name

-- pattern matching
hello :: String -> String
hello "Olafur"     = "hello, Olafur!"
hello "Rocamadour" = "hey!"
hello _            = "Nice to meet you!"


myDouble  x = (if x > 145 then x else x*2) + 1  
myDouble' x = if x > 145  
                        then x  
                        else x*2 

-- show how to define functions using lambdas
notLambda = \x y -> x + y

-- recursion
factorial :: (Intergal a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)


main =
  do
    let (a, b) = vals
    putStrLn (show a)
    putStrLn (show b)

    let (_, c) = f 4
    putStrLn (show c)
    
    let (d, _) = g 4
    putStrLn (show d)
    
    let y = myDouble 1
    putStrLn (show y)
    let y' = myDouble 146
    putStrLn (show y')
    let z = myDouble' 1
    putStrLn (show z)
    let z = myDouble' 146
    putStrLn (show z')
    
    putStrLn (greet "world")
    putStrLn (greetings "world")
    putStrLn (hello "Olafur")
    putStrLn (hello "Rocamadour")
    putStrLn (hello "Jane")
    
    let t = notLambda 1 2
    putStrLn (show t)
    
    let k = factorial 5
    putStrLn (show k)
    
    -- when lambdas are convenient
    map (\x -> x*x - 1) [1..5]
 
 
 
------------------------------------------------------------
-- CURRYING:
-- f :: X ->  Y ->  Z -> A     
-- is the same as
-- f :: X -> (Y -> (Z -> A))
-- one may consider f as a function of type X that returns a function of type Y->Z->A
-- and so on
-- thus one can rewrite any function of multiple arguments into a sequence of functions with single argument

-- currying explained with lambdas:

    \x y z -> x + y + z

-- the same as

    \x -> (\y z -> x + y + z)

-- the same as

    \x -> (\y -> (\z -> x + y + z))

-- because all functions can be seen as functions with single argument, partial application is possible

    add x y = x+y
    add x y = (add x) y 
    add3    = add 3     -- = \y -> 3 + y
    add3 4              -- = (add 3) 4 = add 3 4 = 7

-- this is also the reason why it is possible to write things like this:
    map (+1) [1..5]