import Data.String
import Text.Regex.Posix
import Data.Maybe

decodi :: Int -> (Int, Int) --, String)
decodi z = (n, p)-- , s)
 where
 	n = decantorKi z 3 1
 	p = decantorKi z 3 2 -- + max (decantorKi z 3 1) k
 	-- k = aux2 (auxK s)
	-- s = decod (decantorKi z 3 3)


decod :: Int -> String
decod z = [ x |  k <- [1..(ele z)], x <- deco (degod (z + 1) k)]

ele :: Int -> Int
ele 0 = 0
ele a = (decantorKi (a-1) 2 1 ) + 1

degod :: Int -> Int -> Int
degod z k 
	| k > ele z  || z == 0 = 0
	|otherwise = decantorKi (decantorKi (z - 1) 2 2) (ele z) k

deco :: Int -> String
deco z 
	| tipo z == 0 = "X" ++ show (extr z 1) ++ ":=0;"
	| tipo z == 1 = "X" ++ show (extr z 1) ++ ":=X" ++ show (extr z 2)
	| tipo z == 2 = "X" ++ show (extr z 1) ++ ":=X" ++ show (extr z 2) ++ "+1;"
	| tipo z == 3 = "X" ++ show (extr z 1) ++ ":=X" ++ show (extr z 2) ++ "-1;"
	| otherwise = "while X" ++ show (extr z 1) ++ "!=0 do " ++ decod ((extr z 2)-1) ++ " od;"
			
tipo :: Int -> Int
tipo a = a `mod` 5

extr :: Int -> Int -> Int
extr b n
	| tipo b == 0 = b `div` 5 + 1
	| otherwise = decantorKi ((b - tipo b) `div` 5) 2 n 

decantorKi :: Int -> Int -> Int -> Int
decantorKi z 1 _ = z
decantorKi z _ 1 = decantor21 z
decantorKi z k i = decantorKi (decantor22 z) (k - 1) (i - 1)

decantor22 :: Int -> Int
decantor22 e = e - cantorK [de e , 0]

decantor21 :: Int -> Int
decantor21 r = de r - decantor22 r
		
de :: Int -> Int
de y = head [ t | t <- [1..], cantorK (t:0:[]) > y]

cantorK :: [Int] -> Int
cantorK [] = undefined
cantorK (x:[]) = x
cantorK (x:y:[]) = cantor2 x y
cantorK (x:xs) = cantor2 x (cantorK xs)

cantor2 :: Int -> Int -> Int
cantor2 a b = (a + b) * (a + b + 1) `div` 2 + b

auxK :: String -> MatchArray
auxK "" = undefined
auxK s = sub
	where
		sub = "\\d+(:|!)" =~ s

aux2 :: MatchArray -> Int
aux2 a = undefined