public class StringArrayTest {
    
    public static List<String> generateStringArray (Integer arr_num ){
        List<String> colors = new List<String>();
        
       	for(Integer i=0;i<arr_num;i++) {
            colors.add('Test '+ i);
		}   
        return colors;
    }
}