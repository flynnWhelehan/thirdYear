/* Q1
(a) Make a class Employee with a name and salary. Override the
toString method so that, when applied to an object e of Employee,
it returns the string
Employee[name=#1, salary=#2]
where #1 and #2 are the name and the salary of e, respectively.
*/
class Employee(var name: String, var salary: Int):
  override def toString: String = s"Employee[name=$name, salary=$salary]"
end Employee

/* Q1
(b) Make a class Manager that extends Employee. Add an instance
field, named department, of type String. Supply a method
toString that prints the manager’s name, department, and salary.
*/
class Manager(name: String, salary: Int, var department: String) extends Employee(name, salary):
  override def toString: String = s"Manager[name=$name, department=$department, salary=$salary]"
end Manager

/* Q1
(c) Make a class Executive that extends Manager. Supply the ap-
propriate toString method.
*/
class Executive(name: String, salary: Int, department: String) extends Manager(name, salary, department):
  override def toString: String = s"Executive[name=$name, department=$department, salary=$salary]"
end Executive

/* Q2
Define the following functions in Scala and use its interpreter to test
that each of them is well-defined.

(a) factors : (n:Int)List[Int] that, for any n, returns the list
of factors of n.
(Hint: Use for-comprehension to define (2a) and (2c).)

(b) prime : (n:Int)Boolean that decides whether the input is a
prime number.

(c) primes : (n:Int)List[Int] that, for any n, returns the list of
the prime numbers that are less than or equal to n.
(Hint: Use for-comprehension to define (2a) and (2c).)
*/
class Functions():
  def factors(n: Int): List[Int] =
    (for i <- 1 to n if n % i == 0 yield i).toList
  def prime(n: Int): Boolean = 
    factors(n).length == 2 
  def primes(n: Int): List[Int] =
    (for i <- 1 to n if prime(i) yield i).toList
end Functions

/* Q3
Write a program that prompts the user for an integer, reads it, and
then prints out all prime numbers up to that integer. (Hint: You
may use readInt and println to read an integer and print a line,
respectively.)
*/


@main def Lab6Main =
  // Q1
  val e = Employee("Flynn", 24000)
  println(e)
  val m = Manager("Flynn", 24000, "IT")
  println(m)
  val x = Executive("Flynn", 24000, "IT")
  println(x)

  // Q2
  val f = Functions()
  println(f.factors(10))
  println(f.prime(10))
  println(f.primes(10))

  // Q3
  println("Enter an integer: ")
  val n = scala.io.StdIn.readInt()
  println(f.primes(n))
  