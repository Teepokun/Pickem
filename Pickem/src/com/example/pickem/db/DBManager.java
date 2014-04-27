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

import android.util.Log;

public class DBManager implements TaskCompletedListener {
	
	private TaskCompletedListener listener;
	
	public void addUserAccount(String name, String password, String email, TaskCompletedListener listener) throws NullPointerException {
		
		this.listener = listener;
		
		//verify input
		if(name == null) { throw new NullPointerException("name was null");}
		if(password == null) {throw new NullPointerException("password was null");}
		if(email == null) {throw new NullPointerException("email was null");}
		
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(3);  
	    nameValuePairs.add(new BasicNameValuePair("name", name));  
	    nameValuePairs.add(new BasicNameValuePair("password", password));
	    nameValuePairs.add(new BasicNameValuePair("email", email));  
		
		DBAsyncTask task = new DBAsyncTask("addUserAccount.php", nameValuePairs, this);
		task.execute();
	}
	
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
	
	public void setListener(TaskCompletedListener listener) {
		this.listener = listener;
	}
	
	

	@Override
	public void onNotifyTaskCompleted(Object o) {
		if(listener != null) {
			listener.onNotifyTaskCompleted(o);
		}
	}
}
