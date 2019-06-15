@isTest
public class DistanceCalculatorTestClass {
	@isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new HTTPMockResponseGenerator());
        String actualValue = DistanceCalculator.getDistance('Pune','Mumbai');
        String expectedValue = '93.2 mi';
        System.assertEquals(actualValue, expectedValue);
    }
}