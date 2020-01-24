public class SampleJson {
	public void jsonFormat()
    {
        Map<String, Object> obj = new Map<String, Object>();
		obj.put('action', 'Hello');
		obj.put('Loop', 2);
		obj.put('ids', new List<Integer>{10, 12, 15});
		Map<String, String> mapObj = new Map<String, String>();
		mapObj.put('abc', 'xyz');
		obj.put('mapObject', mapObj);
		System.debug(JSON.Serialize(obj));
    }
}