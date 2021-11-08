package murach.data;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import murach.business.Product;

public class ProductDAO {

    /**
     * Get Product By Id
     * @param id
     * @return
     */
    public Product getProduct(int id) {

        Transaction transaction = null;
        Product product = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            product = session.get(Product.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return product;
    }

    /**
     * Get all products
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Product> listAllProduct() {
        try {
        	return HibernateUtil.getSessionFactory().openSession().createQuery("From Product").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }
}