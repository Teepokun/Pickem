package com.example.pickem.data;

import java.util.Vector;


public class Commissioner extends User {
	private Vector<Pool> commissionerPools;
	
	public Vector<Pool> commissionerPools() {
		return commissionerPools;
	}
	
	public void addToCommissionerPools(Pool p) {
		this.commissionerPools.add(p);
	}
	
	public void deleteFromCommissionerPools(Pool p) {
		for(Pool pool : this.commissionerPools) {
			if(p.compareTo(pool) == 0) {
				this.commissionerPools.remove(pool);
			}
		}
	}

}
