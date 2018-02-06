/**
 * 
 */
package cz.vutbr.fit.mongo;

import java.io.Closeable;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

/**
 * MongoDB demo operations.
 * 
 * @author burgetr
 */
public class MongoDemo implements Closeable
{
	private MongoClient mongoClient;
	private MongoCollection<Document> collection;

	
	public MongoDemo() 
	{
		mongoClient = new MongoClient();
		MongoDatabase database = mongoClient.getDatabase("demoapp");
		collection = database.getCollection("people");
	}

	@Override
	public void close()
	{
		mongoClient.close();
	}
	
	public void createTestingData()
	{
		
		Document karel = new Document("_id", "karel001")
				.append("name", "Karel")
				.append("surname", "Nový")
				.append("born", 1999);
		
		Document eva = new Document("_id", "eva002")
				.append("name", "Eva")
				.append("surname", "Dvořáková")
				.append("born", 2001)
				.append("student", true);
		
		collection.insertOne(karel);
		collection.insertOne(eva);
	}
	
	public Iterable<Document> getData()
	{
		return collection.find();
	}
	
	public void clearData()
	{
		collection.drop();
	}
	
}
