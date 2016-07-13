package com.hwangdang.vo;

import java.io.Serializable;

public class Zipcode implements Serializable
{
	private int seq;
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String bunji;
	
	public Zipcode()
	{
		// TODO Auto-generated constructor stub
	}

	public Zipcode(int seq, String zipcode, String sido, String gugun, String dong, String bunji)
	{
		super();
		this.seq = seq;
		this.zipcode = zipcode;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.bunji = bunji;
	}

	public int getSeq()
	{
		return seq;
	}

	public void setSeq(int seq)
	{
		this.seq = seq;
	}

	public String getZipcode()
	{
		return zipcode;
	}

	public void setZipcode(String zipcode)
	{
		this.zipcode = zipcode;
	}

	public String getSido()
	{
		return sido;
	}

	public void setSido(String sido)
	{
		this.sido = sido;
	}

	public String getGugun()
	{
		return gugun;
	}

	public void setGugun(String gugun)
	{
		this.gugun = gugun;
	}

	public String getDong()
	{
		return dong;
	}

	public void setDong(String dong)
	{
		this.dong = dong;
	}

	public String getBunji()
	{
		return bunji;
	}

	public void setBunji(String bunji)
	{
		this.bunji = bunji;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bunji == null) ? 0 : bunji.hashCode());
		result = prime * result + ((dong == null) ? 0 : dong.hashCode());
		result = prime * result + ((gugun == null) ? 0 : gugun.hashCode());
		result = prime * result + seq;
		result = prime * result + ((sido == null) ? 0 : sido.hashCode());
		result = prime * result + ((zipcode == null) ? 0 : zipcode.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj)
	{
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Zipcode other = (Zipcode) obj;
		if (bunji == null)
		{
			if (other.bunji != null)
				return false;
		} else if (!bunji.equals(other.bunji))
			return false;
		if (dong == null)
		{
			if (other.dong != null)
				return false;
		} else if (!dong.equals(other.dong))
			return false;
		if (gugun == null)
		{
			if (other.gugun != null)
				return false;
		} else if (!gugun.equals(other.gugun))
			return false;
		if (seq != other.seq)
			return false;
		if (sido == null)
		{
			if (other.sido != null)
				return false;
		} else if (!sido.equals(other.sido))
			return false;
		if (zipcode == null)
		{
			if (other.zipcode != null)
				return false;
		} else if (!zipcode.equals(other.zipcode))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "Zipcode [seq=" + seq + ", zipcode=" + zipcode + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong
				+ ", bunji=" + bunji + "]";
	}
}