package com.example.pickem.db;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONObject;

import com.example.pickem.data.Game;
import com.example.pickem.data.Team;
import com.example.pickem.data.User;

import android.util.Log;
/**
 * DBManager holds all the logic for interfacing with the database.
 * It will call DBAsyncTask with the properly validated information 
 * to pass to the db / query db.
 * @author David Lindemann
 *
 */
public class DBManager implements TaskCompletedListener {
	/** Will be deprecated soon. However holds interface to call back*/
	private TaskCompletedListener listener;
	
	/**
	 * Creates a user in the useraccount table in the DB based on the input paramaters.
	 * <p>
	 * User Accounts are comprised of the following information :
	 * @param firstname - first name of the user
	 * @param lastname - last name of the user
	 * @param name - user name
	 * @param password - password to the account
	 * @param email - 
	 * @param listener
	 * @throws NullPointerException
	 */
	public void addUserAccount(String firstname, String lastname, String name, String password, String email, TaskCompletedListener listener) throws NullPointerException {
		
		final TaskCompletedListener fListener = listener;
		
		//verify input
		if(firstname == null) { throw new NullPointerException("firstname was null");}
		if(lastname == null) { throw new NullPointerException("lastname was null");}
		if(name == null) { throw new NullPointerException("name was null");}
		if(password == null) {throw new NullPointerException("password was null");}
		if(email == null) {throw new NullPointerException("email was null");}
		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(3);  
		nameValuePairs.add(new BasicNameValuePair("firstname", firstname)); 
		nameValuePairs.add(new BasicNameValuePair("lastname", lastname)); 
	    nameValuePairs.add(new BasicNameValuePair("name", name));  
	    nameValuePairs.add(new BasicNameValuePair("password", password));
	    nameValuePairs.add(new BasicNameValuePair("email", email));  
		
		DBAsyncTask task = new DBAsyncTask("addUserAccount.php", nameValuePairs, fListener);
		task.execute();
	}
	
	/**
	 * Authenticates user based on email and password
	 * @param name - name of the user account to authenticate to
	 * @param password - password of the user account to authenticate to
	 * @param listener - interface to call back afterwards
	 */
	public void validateLogin(String name, String password, TaskCompletedListener listener) {
		this.listener = listener;
		if(name == null) { throw new NullPointerException("name was null");}
		if(password == null) {throw new NullPointerException("password was null");}
		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);  
	    nameValuePairs.add(new BasicNameValuePair("name", name)); 
	    nameValuePairs.add(new BasicNameValuePair("password", password));
	    DBAsyncTask task = new DBAsyncTask("validateLogin.php", nameValuePairs, this);
	    task.execute();
	}
	
	/**
	 * Gets the teams in the specified conference from the DB
	 * @param name - name of the team
	 * @param conference - name of the conference
	 * @param listener - interface to call back afterwards
	 */
	public void getTeams(String name, String conference, TaskCompletedListener listener) {
		this.listener = listener;
		final TaskCompletedListener tListener = listener;
		if(name == null) { throw new NullPointerException("name was null");}
		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);  
	    nameValuePairs.add(new BasicNameValuePair("name", name)); 
	    if(conference != null) {
	    	nameValuePairs.add(new BasicNameValuePair("conference", name));
	    }
	    
	    //TODO change TaskCompletedListener's behavior
	    DBAsyncTask task = new DBAsyncTask("getTeam.php", nameValuePairs, new TaskCompletedListener() {

			@Override
			public void onNotifyTaskCompleted(Object o) {
				Vector<Team> teams = new Vector<Team>();
				try {
					JSONArray array = new JSONArray((String) o);
					
					for(int i=0; i<array.length();i++) {
						JSONObject row = array.getJSONObject(i);
						Team team = new Team(row.getString("name"), row.getString("conference"), row.getString("record"), row.getString("logo"));
						teams.add(team);
					}
					
				} catch (Exception e) {e.printStackTrace();}
				for(Team t: teams) {
					Log.v("DBManager", t.toString()); 
				}
				tListener.onNotifyTaskCompleted(teams);
			}
	    	
	    });
	    task.execute();
	}
	
	/**
	 * Returns a list of games based on search parameters
	 * @param home - name of the home team
	 * @param away - name of the away team
	 * @param conference - name of the conference
	 * @param listener - interface to call back afterwards
	 */
	public void getGame(String home, String away, String conference, TaskCompletedListener listener) {
		final TaskCompletedListener tListener = listener;
		if(home == null) { throw new NullPointerException("home was null");}
		if(away == null) { throw new NullPointerException("away was null");}
		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(3);  
	    nameValuePairs.add(new BasicNameValuePair("home", home )); 
	    nameValuePairs.add(new BasicNameValuePair("away", away )); 
	    
	    if(conference != null) {
	    	nameValuePairs.add(new BasicNameValuePair("conference", conference));
	    }
	    
	    //TODO change TaskCompletedListener's behavior
	    DBAsyncTask task = new DBAsyncTask("getGame.php", nameValuePairs, new TaskCompletedListener() {

			@Override
			public void onNotifyTaskCompleted(Object o) {
				Vector<Game> games = new Vector<Game>();
				try {
					JSONArray array = new JSONArray((String) o);
					
					for(int i=0; i<array.length();i++) {
						JSONObject row = array.getJSONObject(i);
						Game game = new Game(row.getString("home"), row.getString("away"), row.getString("date"), row.getString("odds"));
						games.add(game);
					}
					
				} catch (Exception e) {e.printStackTrace();}
				for(Game g: games) {
					Log.v("DBManager", g.toString()); 
				}
				tListener.onNotifyTaskCompleted(games);
			}
	    	
	    });
	    task.execute();
	}
	
	/**
	 * Checks if user exists
	 * <p>
	 * This has practical application for checking if a user account exists before creating one.
	 * @param user - users cannot be duplicated in system and must be checked
	 * @param email - emails cannot be duplicated in the system and must be checked
	 * @param listener - interface to call back afterwards
	 */
	public void userExists(String user, String email, TaskCompletedListener listener) {
		final TaskCompletedListener tListener = listener;
		if(user == null) { throw new NullPointerException("home was null");}
		if(email == null) { throw new NullPointerException("away was null");}
		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);  
	    nameValuePairs.add(new BasicNameValuePair("email", email )); 
	    nameValuePairs.add(new BasicNameValuePair("user", user )); 
	    
	    DBAsyncTask task = new DBAsyncTask("userExists.php", nameValuePairs, new TaskCompletedListener() {

			@Override
			public void onNotifyTaskCompleted(Object o) {
				String result[] = null;
				try {
					JSONObject object = new JSONObject((String) o);
					
					String email = object.getString("email");
					String user = object.getString("user");
					
					result = new String[2];
					result[0] = email;
					result[1] = user;
				} catch (Exception e) {e.printStackTrace();}
				
				tListener.onNotifyTaskCompleted(result);
			}
	    	
	    });
	    task.execute();
	}
	
	/**
	 * Grabs user based on email address supplied during login
	 * @param email - email to search for user account on
	 * @param listener - interface to call back afterwards
	 */
	public void getUser(String email, TaskCompletedListener listener) {
		final TaskCompletedListener tListener = listener;
		if(email == null) { throw new NullPointerException("away was null");}
		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);  
	    nameValuePairs.add(new BasicNameValuePair("email", email )); 
	    
	    DBAsyncTask task = new DBAsyncTask("getUser.php", nameValuePairs, new TaskCompletedListener() {

			@Override
			public void onNotifyTaskCompleted(Object o) {
				User user = null;
				try {
					JSONObject object = new JSONObject((String) o);
					user = new User(object.getString("firstname"),
									object.getString("lastname"),
									object.getString("user"),
									object.getString("password"),
									object.getString("email"));
					
				} catch (Exception e) {e.printStackTrace();}
				
				tListener.onNotifyTaskCompleted(user);
			}
	    	
	    });
	    task.execute();
	}
	
	/**
	 * Don't use. Other ways preferable
	 * @param listener - new listener to set the class to
	 * @deprecated
	 */
	public void setListener(TaskCompletedListener listener) {
		this.listener = listener;
	}
	
	/**
	 * Checks if pool exists, returning true | false to the interface
	 * @param name - name of the pool to search for
	 * @param listener - interface to call back afterwards
	 */
	public void doesPoolExist(String name, TaskCompletedListener listener) {
		if(name == null) { throw new NullPointerException("name was null");}
		final TaskCompletedListener tListener = listener; 
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);  
	    nameValuePairs.add(new BasicNameValuePair("name", name )); 
	    DBAsyncTask task = new DBAsyncTask("doesPoolExist.php", nameValuePairs, new TaskCompletedListener() {

			@Override
			public void onNotifyTaskCompleted(Object o) {
				
				String count = null; 
				
				try {
			
					JSONObject object = new JSONObject((String) o);
						count = object.getString("num");
					
				} catch (Exception e) {e.printStackTrace();}
				boolean exists = false;
				if(count != null && count.equals("1")) {
					exists = true;
				}
				tListener.onNotifyTaskCompleted(Boolean.valueOf(exists));
			}
	    	
	    });
	    task.execute();
	}
	
	/**
	 * Returns all polls that a particular user belongs to
	 * @param user - user to search for pools
	 * @param listener - interface to call back afterwards
	 */
	public void getAllUserPools(String user, TaskCompletedListener listener) {
		if(user == null) { throw new NullPointerException("user was null");}
		final TaskCompletedListener tListener = listener; 
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);  
	    nameValuePairs.add(new BasicNameValuePair("user", user )); 
	    
	    DBAsyncTask task = new DBAsyncTask("getAllUserPools.php", nameValuePairs, new TaskCompletedListener() {

			@Override
			public void onNotifyTaskCompleted(Object o) {
				
				List<String> list = new ArrayList<String>(); 
				
				try {
					JSONArray jArray = new JSONArray((String)o);
					for(int i=0;i<jArray.length();i++) {
						JSONObject object = jArray.getJSONObject(i);
						String name = object.getString("name");
						list.add(name);
					}
				} catch (Exception e) {e.printStackTrace();}
				
				tListener.onNotifyTaskCompleted(list);
			}
	    	
	    });
	    task.execute();
	}
	
	/**
	 * Creates a pool based on the given input. Params are self explanatory. 
	 * <p>
	 * However, deadline defaults to today, since time was sort.
	 * @param name
	 * @param conference
	 * @param commissioner
	 * @param password
	 * @param deadline
	 * @param listener
	 */
	public void createPool(String name, String conference, String commissioner, String password, String deadline, TaskCompletedListener listener) {
		if(name == null) { throw new NullPointerException("name was null");}
		if(conference == null) { throw new NullPointerException("conference was null");}

		if(password == null) {password = "";}
		
		if(deadline == null) { throw new NullPointerException("deadline was null");}
		
		final TaskCompletedListener tListener = listener; 
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);  
	    nameValuePairs.add(new BasicNameValuePair("name", name )); 
	    nameValuePairs.add(new BasicNameValuePair("conference", conference )); 
	    nameValuePairs.add(new BasicNameValuePair("commissioner", commissioner )); 
	    nameValuePairs.add(new BasicNameValuePair("password", password )); 
	    nameValuePairs.add(new BasicNameValuePair("deadline", deadline)); 
	    
	    DBAsyncTask task = new DBAsyncTask("createPool.php", nameValuePairs, tListener);
	    
	    task.execute();
	}

	@Override
	/**
	 * Used as a defualt interface. Mostly used for insertions, where the user won't care too much if that was 
	 * successful or not.
	 */
	public void onNotifyTaskCompleted(Object o) {
		if(listener != null) {
			listener.onNotifyTaskCompleted(o);
		}
	}
}
