import spock.lang.Specification

class ExampleTest extends Specification {

	def "Test that pass."(){
		setup:
			def a = 1

		when:
			def b = 2

		then:
			a + b  == 3 
	}

   // Commented, only for reference
   /*
	def "Test that fails."(){
		setup:
			def a = 1

		when:
			def b = 2

		then:
			a + b  == 5 
	}
	*/
}

