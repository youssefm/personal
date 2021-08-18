# Wisdom
* Coding
	* Not all code has the same quality bar. The bar for critical source code should be the highest.
	* Don’t try to be too clever around error conditions, let them fail loudly
	* Don’t be afraid to start new files
	* Always try to leave code better than you found it

* Testing
	* When starting to write unit tests, write a dead-simple success test case and then go from there
	* Not all tests are created equal, the value of your first test is generally much higher than your 100th test for a piece of logic. The value of a test for a critical function is much higher than for a less important function.
	* Test flakiness is the worst, and it must be crushed at all costs

* Django
	* Don’t put too much logic in Django models
	* Avoid Django signals if you can - they make logic really hard to follow and often result in unintended consequences
	* Don’t overuse FilterBackends - FilterSets do the trick most of the time

* It’s especially important to do something right the first time it’s done
* If you have any doubt about design, talk to someone
* Ideas should always win based off merit
* Think about your dependency graph
* Hire people that are at least at the average level of your coworkers
* Don’t treat mocks or designs as the absolute truth, there is always room for negotiation
* A decision that is correct in one context might be wrong in another

* Roles of a Tech lead
	* Assigning the right projects to the right people
	* Managing timelines
	* Setting the quality bar through code reviews
	* Communicating the right information to the right people
	* Figuring out how the puzzle pieces fit together
	* Provide motivation for the work everyone is doing
	* Helping the team make the right design decisions
	* Serving as the point of contact for external communication
	* Unblocking people to be as productive as they can be
	* Creating best practices

* Important traits
	* technical ability
	* leadership skills
	* effective communication
	* strong work ethic
