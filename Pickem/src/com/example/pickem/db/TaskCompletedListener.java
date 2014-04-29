package com.example.pickem.db;

/**
 * Basically uses TaskCompletedListener to notify various callers that a task has completed
 * @author David
 *
 */
public interface TaskCompletedListener {
	public void onNotifyTaskCompleted(Object o);
}
