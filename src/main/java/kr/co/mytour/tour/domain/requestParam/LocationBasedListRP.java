package kr.co.mytour.tour.domain.requestParam;

public class LocationBasedListRP extends RequestParam{
	private String mapX = "";
	private String mapY = "";
	private String radius = "10000";
	
	public String getMapX() {
		return mapX;
	}
	public void setMapX(String mapX) {
		this.mapX = mapX;
	}
	public String getMapY() {
		return mapY;
	}
	public void setMapY(String mapY) {
		this.mapY = mapY;
	}
	public String getRadius() {
		return radius;
	}
	
	public void setRadius(String radius) {
		this.radius = radius;
	}
	
	@Override
	public String toString() {
		return "DetailLocationRP [mapX=" + mapX + ", mapY=" + mapY + ", radius=" + radius + "]";
	}
}
