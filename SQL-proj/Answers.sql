Q set 1:

q1 Which countries have the most Invoices?{

SELECT BillingCountry, COUNT(InvoiceId) invoices
FROM Invoice
GROUP BY BillingCountry
ORDER BY 2 DESC;

}
Result: {

BillingCountry    Invoices
"USA"	              "91"
"Canada"	          "56"
"Brazil"           	"35"
"France"	          "35"
"Germany"	          "28"
"United Kingdom"	  "21"
"Czech Republic"	  "14"
"Portugal"	        "14"
"India"	            "13"
"Argentina"	         "7"
"Australia"	         "7"
"Austria"	           "7"
"Belgium"	           "7"
"Chile"	             "7"
"Denmark"	           "7"
"Finland"	           "7"
"Hungary"	           "7"
"Ireland"	           "7"
"Italy"	             "7"
"Netherlands"	       "7"
"Norway"	           "7"
"Poland"	           "7"
"Spain"	             "7"
"Sweden"	           "7"

}

q2 Which city has the best customers? {
SELECT BillingCity city, Sum(Total) invoices_total
FROM Invoice
GROUP BY 1
ORDER BY 2 DESC
limit 1;
}

Result:{
  city    invoices_total
"Prague"	   "90.24"
}


q3 Who is the best customer? {

SELECT c.CustomerId ,c.FirstName, c.LastName , sum(i.Total) Money_spent
FROM Invoice i
JOIN Customer c
ON c.CustomerId = i.CustomerId
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 1;

}

Result: {
CustomerId   FirstName   LastName    Money_spent
"6"	          "Helena"	  "Holý"	     "49.62"

}
-----------------------------------------------------------------------------

Q set 2:

q1 Dealing with Dublicates: {

SELECT c.Email, c.FirstName, C.LastName, g.Name Genre_name
FROM Invoice i
JOIN InvoiceLine il
ON il.InvoiceId = i.InvoiceId
JOIN Customer c
ON c.CustomerId = i.CustomerId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Genre g
ON g.GenreId = t.GenreId
WHERE g.name = 'Rock'
Group by 1
order by 1;

}
Result: {
        Email           FirstName  LastName   Genre_name
"aaronmitchell@yahoo.ca"	"Aaron"	"Mitchell"  	"Rock"
"alero@uol.com.br"	"Alexandre"	"Rocha"	"Rock"
"astrid.gruber@apple.at"	"Astrid"	"Gruber"	"Rock"
"bjorn.hansen@yahoo.no"	"Bjørn"	"Hansen"	"Rock"
"camille.bernard@yahoo.fr"	"Camille"	"Bernard"	"Rock"
"daan_peeters@apple.be"	"Daan"	"Peeters"	"Rock"
"diego.gutierrez@yahoo.ar"	"Diego"	"Gutiérrez"	"Rock"
"dmiller@comcast.com"	"Dan"	"Miller"	"Rock"
"dominiquelefebvre@gmail.com"	"Dominique"	"Lefebvre"	"Rock"
"edfrancis@yachoo.ca"	"Edward"	"Francis"	"Rock"
"eduardo@woodstock.com.br"	"Eduardo"	"Martins"	"Rock"
"ellie.sullivan@shaw.ca"	"Ellie"	"Sullivan"	"Rock"
"emma_jones@hotmail.com"	"Emma"	"Jones"	"Rock"
"enrique_munoz@yahoo.es"	"Enrique"	"Muñoz"	"Rock"
"fernadaramos4@uol.com.br"	"Fernanda"	"Ramos"	"Rock"
"fharris@google.com"	"Frank"	"Harris"	"Rock"
"fralston@gmail.com"	"Frank"	"Ralston"	"Rock"
"frantisekw@jetbrains.com"	"František"	"Wichterlová"	"Rock"
"ftremblay@gmail.com"	"François"	"Tremblay"	"Rock"
"fzimmermann@yahoo.de"	"Fynn"	"Zimmermann"	"Rock"
"hannah.schneider@yahoo.de"	"Hannah"	"Schneider"	"Rock"
"hholy@gmail.com"	"Helena"	"Holý"	"Rock"
"hleacock@gmail.com"	"Heather"	"Leacock"	"Rock"
"hughoreilly@apple.ie"	"Hugh"	"O'Reilly"	"Rock"
"isabelle_mercier@apple.fr"	"Isabelle"	"Mercier"	"Rock"
"jacksmith@microsoft.com"	"Jack"	"Smith"	"Rock"
"jenniferp@rogers.ca"	"Jennifer"	"Peterson"	"Rock"
"jfernandes@yahoo.pt"	"João"	"Fernandes"	"Rock"
"joakim.johansson@yahoo.se"	"Joakim"	"Johansson"	"Rock"
"johavanderberg@yahoo.nl"	"Johannes"	"Van der Berg"	"Rock"
"johngordon22@yahoo.com"	"John"	"Gordon"	"Rock"
"jubarnett@gmail.com"	"Julia"	"Barnett"	"Rock"
"kachase@hotmail.com"	"Kathy"	"Chase"	"Rock"
"kara.nielsen@jubii.dk"	"Kara"	"Nielsen"	"Rock"
"ladislav_kovacs@apple.hu"	"Ladislav"	"Kovács"	"Rock"
"leonekohler@surfeu.de"	"Leonie"	"Köhler"	"Rock"
"lucas.mancini@yahoo.it"	"Lucas"	"Mancini"	"Rock"
"luisg@embraer.com.br"	"Luís"	"Gonçalves"	"Rock"
"luisrojas@yahoo.cl"	"Luis"	"Rojas"	"Rock"
"manoj.pareek@rediff.com"	"Manoj"	"Pareek"	"Rock"
"marc.dubois@hotmail.com"	"Marc"	"Dubois"	"Rock"
"mark.taylor@yahoo.au"	"Mark"	"Taylor"	"Rock"
"marthasilk@gmail.com"	"Martha"	"Silk"	"Rock"
"masampaio@sapo.pt"	"Madalena"	"Sampaio"	"Rock"
"michelleb@aol.com"	"Michelle"	"Brooks"	"Rock"
"mphilips12@shaw.ca"	"Mark"	"Philips"	"Rock"
"nschroder@surfeu.de"	"Niklas"	"Schröder"	"Rock"
"patrick.gray@aol.com"	"Patrick"	"Gray"	"Rock"
"phil.hughes@gmail.com"	"Phil"	"Hughes"	"Rock"
"puja_srivastava@yahoo.in"	"Puja"	"Srivastava"	"Rock"
"ricunningham@hotmail.com"	"Richard"	"Cunningham"	"Rock"
"robbrown@shaw.ca"	"Robert"	"Brown"	"Rock"
"roberto.almeida@riotur.gov.br"	"Roberto"	"Almeida"	"Rock"
"stanisław.wójcik@wp.pl"	"Stanisław"	"Wójcik"	"Rock"
"steve.murray@yahoo.uk"	"Steve"	"Murray"	"Rock"
"terhi.hamalainen@apple.fi"	"Terhi"	"Hämäläinen"	"Rock"
"tgoyer@apple.com"	"Tim"	"Goyer"	"Rock"
"vstevens@yahoo.com"	"Victor"	"Stevens"	"Rock"
"wyatt.girard@yahoo.fr"	"Wyatt"	"Girard"	"Rock"

}

q2 Who is writing the rock music? : {

SELECT a.ArtistId, a.Name Artist_name, count(t.AlbumId) Songs
FROM Artist a
JOIN Album al
ON a.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN Genre g
ON g.GenreId = t.GenreId
WHERE g.name = 'Rock'
Group by 1,2
order by 3 DESC
LIMIT 10;

}

Result: {
ArtistId  Artist_name   Songs
 "22"	  "Led Zeppelin"  "114"
"150"	"U2"	"112"
"58"	"Deep Purple"	"92"
"90"	"Iron Maiden"	"81"
"118"	"Pearl Jam"	"54"
"152"	"Van Halen"	"52"
"51"	"Queen"	"45"
"142"	"The Rolling Stones"	"41"
"76"	"Creedence Clearwater Revival"	"40"
"52"	"Kiss"	"35"

}

q3 First, find which artist has earned the most according to the InvoiceLines?:{

SELECT a.ArtistId, a.Name, (count(il.Quantity) * il.UnitPrice) Amount_spent_each
FROM Artist a
JOIN Album al
ON a.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN Genre g
ON g.GenreId = t.GenreId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
Group by 1,2
order by 3 DESC;

}

Result: {
ArtistId   Artist_name    Amount_spent_each
"90"    	"Iron Maiden"	      "138.6"
"150"	"U2"	"105.93"
"50"	"Metallica"	"90.09"
"22"	"Led Zeppelin"	"86.13"
"149"	"Lost"	"81.59"
"156"	"The Office"	"49.75"
"113"	"Os Paralamas Do Sucesso"	"44.55"
"58"	"Deep Purple"	"43.56"
"82"	"Faith No More"	"41.58"
"81"	"Eric Clapton"	"39.6"
"124"	"R.E.M."	"38.61"
"51"	"Queen"	"36.63"
"76"	"Creedence Clearwater Revival"	"36.63"
"158"	"Battlestar Galactica (Classic)"	"35.82"
"88"	"Guns N' Roses"	"35.64"
"146"	"Titãs"	"33.66"
"54"	"Green Day"	"32.67"
"118"	"Pearl Jam"	"31.68"
"52"	"Kiss"	"30.69"
"21"	"Various Artists"	"28.71"
"152"	"Van Halen"	"28.71"
"17"	"Chico Buarque"	"26.73"
"127"	"Red Hot Chili Peppers"	"26.73"
"148"	"Heroes"	"25.87"
"100"	"Lenny Kravitz"	"25.74"
"18"	"Chico Science & Nação Zumbi"	"24.75"
"147"	"Battlestar Galactica"	"23.88"
"114"	"Ozzy Osbourne"	"23.76"
"131"	"Smashing Pumpkins"	"23.76"
"145"	"Tim Maia"	"23.76"
"6"	"Antônio Carlos Jobim"	"21.78"
"84"	"Foo Fighters"	"21.78"
"16"	"Caetano Veloso"	"20.79"
"77"	"Cássia Eller"	"20.79"
"27"	"Gilberto Gil"	"19.8"
"53"	"Spyro Gyra"	"19.8"
"144"	"The Who"	"18.81"
"80"	"Djavan"	"17.82"
"92"	"Jamiroquai"	"17.82"
"142"	"The Rolling Stones"	"17.82"
"252"	"Amy Winehouse"	"17.82"
"68"	"Miles Davis"	"16.83"
"69"	"Gene Krupa"	"16.83"
"99"	"Legião Urbana"	"16.83"
"143"	"The Tea Party"	"16.83"
"1"	"AC/DC"	"15.84"
"8"	"Audioslave"	"15.84"
"19"	"Cidade Negra"	"15.84"
"139"	"The Cult"	"15.84"
"42"	"Milton Nascimento"	"14.85"
"70"	"Toquinho & Vinícius"	"14.85"
"132"	"Soundgarden"	"14.85"
"137"	"The Black Crowes"	"13.86"
"41"	"Elis Regina"	"12.87"
"101"	"Lulu Santos"	"12.87"
"111"	"O Terço"	"12.87"
"14"	"Bruce Dickinson"	"11.88"
"59"	"Santana"	"11.88"
"91"	"James Brown"	"11.88"
"110"	"Nirvana"	"11.88"
"135"	"System Of A Down"	"11.88"
"13"	"Body Count"	"10.89"
"3"	"Aerosmith"	"9.9"
"85"	"Frank Sinatra"	"9.9"
"98"	"Judas Priest"	"9.9"
"104"	"Marvin Gaye"	"9.9"
"112"	"Olodum"	"9.9"
"126"	"Raul Seixas"	"9.9"
"130"	"Skank"	"9.9"
"134"	"Stone Temple Pilots"	"9.9"
"138"	"The Clash"	"9.9"
"12"	"Black Sabbath"	"8.91"
"56"	"Gonzaguinha"	"8.91"
"89"	"Incognito"	"8.91"
"116"	"Passengers"	"8.91"
"121"	"Planet Hemp"	"8.91"
"122"	"R.E.M. Feat. Kate Pearson"	"8.91"
"133"	"Stevie Ray Vaughan & Double Trouble"	"8.91"
"155"	"Zeca Pagodinho"	"8.91"
"4"	"Alanis Morissette"	"7.92"
"11"	"Black Label Society"	"7.92"
"55"	"David Coverdale"	"7.92"
"57"	"Os Mutantes"	"7.92"
"83"	"Falamansa"	"7.92"
"86"	"Funk Como Le Gusta"	"7.92"
"87"	"Godsmack"	"7.92"
"94"	"Jimi Hendrix"	"7.92"
"103"	"Marisa Monte"	"7.92"
"105"	"Men At Work"	"7.92"
"115"	"Page & Plant"	"7.92"
"151"	"UB40"	"7.92"
"180"	"House Of Pain"	"7.92"
"5"	"Alice In Chains"	"6.93"
"15"	"Buddy Guy"	"6.93"
"24"	"Marcos Valle"	"6.93"
"36"	"O Rappa"	"6.93"
"78"	"Def Leppard"	"6.93"
"93"	"JET"	"6.93"
"109"	"Mötley Crüe"	"6.93"
"125"	"Raimundos"	"6.93"
"141"	"The Police"	"6.93"
"9"	"BackBeat"	"5.94"
"37"	"Ed Motta"	"5.94"
"46"	"Jorge Ben"	"5.94"
"72"	"Vinícius De Moraes"	"5.94"
"96"	"Jota Quest"	"5.94"
"97"	"João Suplicy"	"5.94"
"106"	"Motörhead"	"5.94"
"108"	"Mônica Marianno"	"5.94"
"128"	"Rush"	"5.94"
"153"	"Velvet Revolver"	"5.94"
"2"	"Accept"	"4.95"
"20"	"Cláudio Zoli"	"4.95"
"102"	"Marillion"	"4.95"
"117"	"Paul D'Ianno"	"4.95"
"136"	"Terry Bozzio, Tony Levin & Steve Stevens"	"4.95"
"179"	"Scorpions"	"4.95"
"159"	"Aquaman"	"3.98"
"7"	"Apocalyptica"	"3.96"
"10"	"Billy Cobham"	"3.96"
"23"	"Frank Zappa & Captain Beefheart"	"3.96"
"79"	"Dennis Chambers"	"3.96"
"95"	"Joe Satriani"	"3.96"
"120"	"Pink Floyd"	"3.96"
"140"	"The Doors"	"3.96"
"204"	"Temple of the Dog"	"3.96"
"205"	"Chris Cornell"	"3.96"
"245"	"Michael Tilson Thomas & San Francisco Symphony"	"2.97"
"226"	"Eugene Ormandy"	"1.98"
"233"	"Chicago Symphony Orchestra & Fritz Reiner"	"1.98"
"248"	"Berliner Philharmoniker & Herbert Von Karajan"	"1.98"
"257"	"Academy of St. Martin in the Fields, Sir Neville Marriner & Thurston Dart"	"1.98"
"263"	"Equale Brass Ensemble, John Eliot Gardiner & Munich Monteverdi Orchestra and Choir"	"1.98"
"272"	"Emerson String Quartet"	"1.98"
"157"	"Dread Zeppelin"	"0.99"
"198"	"Habib Koité and Bamada"	"0.99"
"200"	"The Posies"	"0.99"
"201"	"Luciana Souza/Romero Lubambo"	"0.99"
"208"	"English Concert & Trevor Pinnock"	"0.99"
"212"	"Yo-Yo Ma"	"0.99"
"213"	"Scholars Baroque Ensemble"	"0.99"
"214"	"Academy of St. Martin in the Fields & Sir Neville Marriner"	"0.99"
"217"	"Royal Philharmonic Orchestra & Sir Thomas Beecham"	"0.99"
"221"	"Sir Georg Solti & Wiener Philharmoniker"	"0.99"
"222"	"Academy of St. Martin in the Fields, John Birch, Sir Neville Marriner & Sylvia McNair"	"0.99"
"234"	"Orchestra of The Age of Enlightenment"	"0.99"
"235"	"Emanuel Ax, Eugene Ormandy & Philadelphia Orchestra"	"0.99"
"237"	"Berliner Philharmoniker & Hans Rosbaud"	"0.99"
"238"	"Maurizio Pollini"	"0.99"
"241"	"Felix Schmidt, London Symphony Orchestra & Rafael Frühbeck de Burgos"	"0.99"
"242"	"Edo de Waart & San Francisco Symphony"	"0.99"
"243"	"Antal Doráti & London Symphony Orchestra"	"0.99"
"247"	"The King's Singers"	"0.99"
"253"	"Calexico"	"0.99"
"254"	"Otto Klemperer & Philharmonia Orchestra"	"0.99"
"255"	"Yehudi Menuhin"	"0.99"
"256"	"Philharmonia Orchestra & Sir Neville Marriner"	"0.99"
"259"	"The 12 Cellists of The Berlin Philharmonic"	"0.99"
"260"	"Adrian Leaper & Doreen de Feis"	"0.99"
"261"	"Roger Norrington, London Classical Players"	"0.99"
"264"	"Kent Nagano and Orchestre de l'Opéra de Lyon"	"0.99"
"265"	"Julian Bream"	"0.99"
"266"	"Martin Roscoe"	"0.99"
"267"	"Göteborgs Symfoniker & Neeme Järvi"	"0.99"
"269"	"Michele Campanella"	"0.99"

}



Now use this artist to find which customer spent the most on this artist. :{

SELECT a.Name, (count(il.Quantity) * il.UnitPrice) Amount_spent, c.CustomerId, c.FirstName, c.LastName
FROM Artist a
JOIN Album al
ON a.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN Genre g
ON g.GenreId = t.GenreId
JOIN InvoiceLine il
ON il.TrackId = t.TrackId
JOIN Invoice i
ON i.InvoiceId = il.InvoiceId
JOIN Customer c
ON c.CustomerId = i.CustomerId
WHERE a.Name = 'Iron Maiden'
GROUP BY 1, 3, 4, 5
ORDER BY 2 DESC;

}

Result: {

 Artist_name   Amount_spent  CustomerId  FirstName    LastName
"Iron Maiden"	    "17.82"	      "55"      	"Mark"  	"Taylor"
"Iron Maiden"	"15.84"	"35"	"Madalena"	"Sampaio"
"Iron Maiden"	"13.86"	"16"	"Frank"	"Harris"
"Iron Maiden"	"13.86"	"36"	"Hannah"	"Schneider"
"Iron Maiden"	"8.91"	"5"	"František"	"Wichterlová"
"Iron Maiden"	"8.91"	"27"	"Patrick"	"Gray"
"Iron Maiden"	"5.94"	"19"	"Tim"	"Goyer"
"Iron Maiden"	"5.94"	"39"	"Camille"	"Bernard"
"Iron Maiden"	"5.94"	"58"	"Manoj"	"Pareek"
"Iron Maiden"	"4.95"	"7"	"Astrid"	"Gruber"
"Iron Maiden"	"4.95"	"25"	"Victor"	"Stevens"
"Iron Maiden"	"3.96"	"15"	"Jennifer"	"Peterson"
"Iron Maiden"	"3.96"	"54"	"Steve"	"Murray"
"Iron Maiden"	"2.97"	"50"	"Enrique"	"Muñoz"
"Iron Maiden"	"1.98"	"11"	"Alexandre"	"Rocha"
"Iron Maiden"	"1.98"	"13"	"Fernanda"	"Ramos"
"Iron Maiden"	"1.98"	"31"	"Martha"	"Silk"
"Iron Maiden"	"1.98"	"33"	"Ellie"	"Sullivan"
"Iron Maiden"	"1.98"	"51"	"Joakim"	"Johansson"
"Iron Maiden"	"1.98"	"52"	"Emma"	"Jones"
"Iron Maiden"	"1.98"	"53"	"Phil"	"Hughes"
"Iron Maiden"	"1.98"	"59"	"Puja"	"Srivastava"
"Iron Maiden"	"0.99"	"10"	"Eduardo"	"Martins"
"Iron Maiden"	"0.99"	"30"	"Edward"	"Francis"
"Iron Maiden"	"0.99"	"45"	"Ladislav"	"Kovács"
"Iron Maiden"	"0.99"	"46"	"Hugh"	"O'Reilly"
"Iron Maiden"	"0.99"	"49"	"Stanisław"	"Wójcik"
}


Q set 3:

q1 {
NOT complete

SELECT count(i.Total), g.Name, i.BillingCountry
FROM Invoice i
JOIN InvoiceLine il
ON i.InvoiceId = il.InvoiceId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Genre g
ON g.GenreId = t.GenreId
GROUP BY 2,3
order by 1 DESC

}


q2 {

SELECT Name, Milliseconds
FROM Track
WHERE Milliseconds > (SELECT avg(Milliseconds) FROM Track)
ORDER BY 2 DESC;

}

Result {


}

q3 { NOT complete

SELECT i.BillingCountry,
(SELECT SUM(i.Total) Totalspent
FROM Customer c
JOIN Invoice i
ON i.CustomerId = c.CustomerId
GROUP BY i.BillingCountry
ORDER BY 1) AS t1, c.FirstName, c.LastName, c.CustomerId
From Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
GROUP BY 1;


}
