# Logical operators


if [ arg1 operator arg2 ] ; then list
or
if [ arg1 operator arg2 ] ; then list ; else list ; fi


## in block

File="TestFile1"
echo "This is $File" > $File
if [ -s $File ]
   then
   echo "$File exists and contains data."
elif [ -e $File ]
   then
   echo "$File exists and is empty."
else
   echo "$File does not exist."
fi

# The Bash file operators

Operator	Description
-a filename	True if the file exists; it can be empty or have some content but, so long as it exists, this will be true
-b filename	True if the file exists and is a block special file such as a hard drive like /dev/sda or /dev/sda1
-c filename	True if the file exists and is a character special file such as a TTY device like /dev/TTY1
-d filename	True if the file exists and is a directory
-e filename	True if the file exists; this is the same as -a above
-f filename	True if the file exists and is a regular file, as opposed to a directory, a device special file, or a link, among others
-g filename	True if the file exists and is set-group-id, SETGID
-h filename	True if the file exists and is a symbolic link
-k filename	True if the file exists and its "sticky'" bit is set
-p filename	True if the file exists and is a named pipe (FIFO)
-r filename	True if the file exists and is readable, i.e., has its read bit set
-s filename	True if the file exists and has a size greater than zero; a file that exists but that has a size of zero will return false
-t fd	True if the file descriptor fd is open and refers to a terminal
-u filename	True if the file exists and its set-user-id bit is set
-w filename	True if the file exists and is writable
-x filename	True if the file exists and is executable
-G filename	True if the file exists and is owned by the effective group ID
-L filename	True if the file exists and is a symbolic link
-N filename	True if the file exists and has been modified since it was last read
-O filename	True if the file exists and is owned by the effective user ID
-S filename	True if the file exists and is a socket
file1 -ef file2	True if file1 and file2 refer to the same device and iNode numbers
file1 -nt file2	True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not
file1 -ot file2	True if file1 is older than file2, or if file2 exists and file1 does not


# The command line program rewritten as it would appear in a script

## Bash string logical operators

Operator	Description
-z string	True if the length of string is zero
-n string	True if the length of string is non-zero
string1 == string2
or
string1 = string2	True if the strings are equal; a single = should be used with the test command for POSIX conformance. When used with the [[ command, this performs pattern matching as described above (compound commands).
string1 != string2	True if the strings are not equal
string1 < string2	True if string1 sorts before string2 lexicographically (refers to locale-specific sorting sequences for all alphanumeric and special characters)
string1 > string2	True if string1 sorts after string2 lexicographically


## Bash numeric comparison logical operators

Operator	Description
arg1 -eq arg2	True if arg1 equals arg2
arg1 -ne arg2	True if arg1 is not equal to arg2
arg1 -lt arg2	True if arg1 is less than arg2
arg1 -le arg2	True if arg1 is less than or equal to arg2
arg1 -gt arg2	True if arg1 is greater than arg2
arg1 -ge arg2	True if arg1 is greater than or equal to arg2


## Miscellaneous Bash logical operators

Operator	Description
-o optname	True if the shell option optname is enabled (see the list of options under the description of the -o option to the Bash set builtin in the Bash man page)
-v varname	True if the shell variable varname is set (has been assigned a value)
-R varname	True if the shell variable varname is set and is a name reference


# Expansions

Bash supports a number of types of expansions and substitutions that can be quite useful. According to the Bash man page, Bash has seven forms of expansions. This article looks at five of them: tilde expansion, arithmetic expansion, pathname expansion, brace expansion, and command substitution.

Brace expansion
Brace expansion is a method for generating arbitrary strings. (This tool is used below to create a large number of files for experiments with special pattern characters.) Brace expansion can be used to generate lists of arbitrary strings and insert them into a specific location within an enclosing static string or at either end of a static string. This may be hard to visualize, so it's best to just do it.

```bash
$ echo {string1,string2,string3}
string1 string2 string3<Paste>

$ echo "Hello "{David,Jen,Rikki,Jason}.
Hello David. Hello Jen. Hello Rikki. Hello Jason.

$  ls -d Do*
Download Documennts

$ echo "Todays date is `date`"
Todays date is Sun Apr  7 14:42:46 EDT 2019

$ echo "Todays date is $(date)"
Todays date is Sun Apr  7 14:42:59 EDT 2019

$ seq 4
1
2
3
4

$ echo `seq 5`
1 2 3 4 5


```


## cilcos

for VARIABLE in 1 2 3 4 5 .. N
Ejecute el siguiente comando:
    command1
    command2
    commandN
done

for VARIABLE in file1 file2 file3
do
    command1 on $VARIABLE
    command2
    commandN
done

for OUTPUT in $(Linux-Or-Unix-Command-Here)
do
    command1 on $OUTPUT
    command2 on $OUTPUT
    commandN
done

```
$ for i in $(seq -w 4); do echo "hello" $i; done
 hello 1
 hello 2
 hello 3
 hello 4

# {START. .END. .INCREMENT}.

$ for i in {1. .5}
do
  echo "Hai $i"
done

for (( c=1; c<=5; c++ ))
do  
  echo "Hai $c"
done
```

### Directris 	matematica

echo $((1+1))

$Var1=5 ; Var2=7 ; Var3=$((Var1*Var2)) ; echo "Var 3 = $Var3"
Var 3 = 35

## CASE

case EXPRESSION in

  PATTERN_1)
    STATEMENTS
    ;;

  PATTERN_2)
    STATEMENTS
    ;;

  PATTERN_N)
    STATEMENTS
    ;;

  *)
    STATEMENTS
    ;;
esac
