package com.hwangdang.vo;

import java.io.Serializable;

public class Code implements Serializable
{
	private String code;
	private String codeName;
	
	public Code()
	{
		// TODO Auto-generated constructor stub
	}

	public Code(String code, String codeName)
	{
		super();
		this.code = code;
		this.codeName = codeName;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getCodeName()
	{
		return codeName;
	}

	public void setCodeName(String codeName)
	{
		this.codeName = codeName;
	}

	@Override
	public int hashCode()
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + ((codeName == null) ? 0 : codeName.hashCode());
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
		Code other = (Code) obj;
		if (code == null)
		{
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (codeName == null)
		{
			if (other.codeName != null)
				return false;
		} else if (!codeName.equals(other.codeName))
			return false;
		return true;
	}

	@Override
	public String toString()
	{
		return "Code [code=" + code + ", codeName=" + codeName + "]";
	}
}
