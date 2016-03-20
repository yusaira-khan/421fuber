import java.sql.*;
import java.util.Scanner;

class connectExample {
public static void main( String args [] ) throws SQLException{
	DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
	// Connect to the databaseConnection 

	String password = System.getenv("PASSWORD"); //replace this function call with password. removed because storing in github
	//or write in bash: export PASSWORD=******


	conn= DriverManager.getConnection("jdbc:db2://db2:50000/cs421","cs421g32", password);

	PreparedStatement  user  = con.prepareStatement("SELECT  * FROM  User  where  email = ?");//you can put arguments at the question marks
	PreparedStatement  count  = con.prepareStatement("SELECT COUNT(*) AS total FROM take_ride where uid = ?");
	PreparedStatement  subs  = con.prepareStatement("SELECT * FROM Subscription where uid = ?");
	Scanner sc = new Scanner(System.in);
	String email = sc.nextLine();
	user.setString(1,email);//setting the string at the 1st question mark of the preparedstatement
	int user_id;
	String creditcard, name;
	ResultSet  rsUser = user.executeQuery(), rsCount,rsSubs;

	if(rsUser.next()){
		user_id = rsUser.getInt("uid");//rs.get the 1st returned value
		creditcard=rsUser.getString("ccNumber");
		name=rsUser.getString("name");

	}else{
		System.out.println("No user with email: "+email+" found. sorry");
		System.exit(1);//shutting down program
	}

	System.out.println("Hello "+name+"!");
	count.setInt(1,user_id);
	rsCount= count.executeQuery();
	if(rsCount.next()){
		int rideCount =  rsCount.getInt("total");
		System.out.println("You have taken "+total+" rides.");
	} 

	subs.setInt(1,user_id);
	rsSubs= count.executeQuery();
	if(rsSubs.next()){
		int subsNum =  rsSubs.getInt("subsNumber");
		Date exp = rsSubs.getDate("endDate");
		double price =  rsSubs.getDouble("monthlyPrice");
		System.out.println("You have Subscription "+subsNum" ending on "+exp.toString+" costing "+price+" per month");
	}
	System.out.println("Bye!");





}