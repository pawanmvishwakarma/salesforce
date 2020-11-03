@isTest
private class TestScheduleEmail{

	@testSetup static void setup(){

		Account accountObj = new Account (
			Industry ='Agriculture', 
			Name = 'test value'
		);
		insert accountObj;
		 
	}

	@isTest static void testMethod1() {
		Test.startTest();
			String jobId = System.schedule('Testing jobs', '0 45 5 1/1 * ? *', new ScheduleEmail());
			CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
	
			// Verify the expressions are the same
			System.assertEquals('0 45 5 1/1 * ? *', ct.CronExpression);
		
			// Verify the job has not run
			System.assertEquals(0, ct.TimesTriggered);
		Test.stopTest();

	}

	@isTest static void testMethod2() {
		// code_block	
	}
}