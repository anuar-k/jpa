import entity.Category;
import entity.Option;
import entity.Product;
import entity.Value;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.*;
import java.util.stream.Collectors;

public class Main {
    private static final EntityManagerFactory factory = Persistence.createEntityManagerFactory("main");
    private static EntityManager manager = factory.createEntityManager();
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String... args) {
        try {
            while (true) {
                System.out.println("-----------------------------");
                if (args.length > 0)
                    System.out.println(args);
                System.out.println("Выберите действие:\n" +
                        "- Вывести список продуктов [1]\n" +
                        "- Добавление продукта      [2]\n" +
                        "- Обновить продукта        [3]\n" +
                        "- Удаление продукта        [4]\n" +
                        "- Сортировка продукта      [5]\n" +
                        "-----------------------------"
                );
                int actionType = Integer.parseInt(scanner.nextLine());
                switch (actionType) {
                    case 1:
                        get();
                        break;
                    case 2:
                        add();
                        break;
                    case 3:
                        update();
                        break;
                    case 4:
                        delete();
                        break;
                    case 5:
                        filter();
                        break;
                    default:
                        main("Выберите верное значение");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void get() {
        try {
            manager.getTransaction().begin();
            System.out.println("---- Выберите категорию товара ----");
            TypedQuery<Category> queryCategory = manager.createQuery("select c from Category c", Category.class);
            List<Category> categories = queryCategory.getResultList();
            categories.stream().map(category -> "id:" + category.getId() + " - " + category.getName())
                    .forEach(System.out::println);
            int categoryId = Integer.parseInt(scanner.nextLine());
            TypedQuery<Product> queryProduct = manager.createQuery("select c from Product c where c.category.id=" + categoryId, Product.class);
            List<Product> products = queryProduct.getResultList();
            products.stream().map(category -> "id:" + category.getId() + " " + category.getName())
                    .forEach(System.out::println);
            manager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            manager.getTransaction().rollback();
        }
    }

    public static void add() {
        try {
            manager.getTransaction().begin();
            Product product = new Product();
            System.out.println("--- Создание нового продукта ----");
            TypedQuery<Category> query = manager.createQuery("select c from Category c", Category.class);
            List<Category> categories = query.getResultList();
            categories.stream().map(category1 -> category1.getId() + " " + category1.getName())
                    .forEach(System.out::println);
            System.out.println("Выберите категорию продукта:");
            Long categoryId = (long) Integer.parseInt(scanner.nextLine());
            Category category = manager.find(Category.class, categoryId);
            product.setCategory(category);
            System.out.println("Введите имя продукта:");
            String categoryName = scanner.nextLine();
            product.setName(categoryName);
            System.out.println("Введите цену продукта:");
            Double categoryPrice = Double.valueOf(scanner.nextLine());
            product.setPrice(categoryPrice);
            System.out.println("--------------------");
            manager.persist(product);
            List<Option> options = category.getOptions();
            for (Option option : options) {
                Value value = new Value();
                System.out.println(option.getName());
                String optionName = scanner.nextLine();
                value.setValue(optionName);
                value.setOption(option);
                value.setProduct(product);
                manager.persist(value);
            }
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public static void update() {
        try {
            manager.getTransaction().begin();
            System.out.println("---- Изменение товара ----");
            System.out.println("Выберите продукт для обновления");
            TypedQuery<Product> query = manager.createQuery("select c from Product c", Product.class);
            List<Product> products = query.getResultList();
            products.stream().map(a -> "id:[" + a.getId() + "] - " + a.getName()).forEach(System.out::println);
            Long productId = Long.valueOf(scanner.nextLine());
            Product product = manager.find(Product.class, productId);
            System.out.println("Вы выбрали \n"
                    + "категория: " + product.getCategory().getName() + "\n"
                    + "название: " + product.getName() + "\n"
                    + "цена: " + product.getPrice() + "\n");
            System.out.println("------------");
            System.out.print("Имя товара[" + product.getName() + "]: ");
            String name = scanner.nextLine();
            try {
                if (!name.isEmpty()) product.setName(name);
                System.out.print("Цена товара[" + product.getPrice() + "]: ");
                String price = scanner.nextLine();
                if (!price.isEmpty()) {
                    product.setPrice(Double.parseDouble(price));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            List<Option> options = product.getCategory().getOptions();
            for (Option option : options) {
                Value value = option.getValues().get(0);
                System.out.print(option.getName() + "[" + option.getValues().get(0).getValue() + "]");
                String newValue = scanner.nextLine();
                if (!newValue.isEmpty()) {
                    value.setValue(newValue);
                }
                manager.persist(value);
            }
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public static void delete() {
        try {
            manager.getTransaction().begin();
            System.out.println("--- Удаление продукта ---");
            System.out.println("Выберите продукт для удаления:");
            TypedQuery<Product> query = manager.createQuery("select c from Product c", Product.class);
            List<Product> products = query.getResultList();
            products.stream().map(a -> "- id:[" + a.getId() + "] - " + a.getName()).forEach(System.out::println);
            System.out.print("Введите id для удаления: ");
            Long productId = Long.valueOf(scanner.nextLine());
            Product product = manager.find(Product.class, productId);
            manager.remove(product);
            manager.getTransaction().commit();
            System.out.println("удален!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void filter() {
        Integer categoryID = null;
        String name = null;
        Integer maxPrice = null;
        Integer minPrice = null;
        Map<Long, String> options = new HashMap<>();
        try {
            manager.getTransaction().begin();
            System.out.println("Выберите категорию:");
            List<Category> categories = manager.createQuery("select c from Category c ", Category.class).getResultList();
            categories.stream().map(category -> "[" + category.getId() + "]" + category.getName()).forEach(System.out::println);
            System.out.print("Выберите категорию:");
            String categoryInput = scanner.nextLine();
            categoryID = categoryInput.isEmpty() ? null : Integer.parseInt(categoryInput);
            if (categoryID != null) {
                List<Product> categoryList = manager.createQuery("select c from Product c where c.category=" + categoryID.longValue()).getResultList();
                print(categoryList);
            }
            System.out.print("Введиете имя продукта:");
            String filterName = scanner.nextLine();
            name = !filterName.isEmpty() ? filterName : null;
            System.out.print("Введи минимальную цену:");
            String minPriceInput = scanner.nextLine();
            minPrice = minPriceInput.isEmpty() ? null : Integer.parseInt(minPriceInput);
            System.out.print("Введи максимальную цену:");
            String maxPriceInput = scanner.nextLine();
            maxPrice = maxPriceInput.isEmpty() ? null : Integer.parseInt(maxPriceInput);
            System.out.print("Введите option ID:");
            String optionId = scanner.nextLine();
            System.out.print("Введите option value:");
            String optionValue = scanner.nextLine();
            ArrayList<String> secondQuery = new ArrayList<>();

            if (optionId != null && !optionId.isEmpty() && optionValue != null && !optionValue.isEmpty()) {
                options.put(Long.valueOf(optionId), optionValue);
            }
            if (options.isEmpty()) {
                for (Map.Entry<Long, String> entry : options.entrySet()) {
                    secondQuery.add("JOIN Value AS v ON p.id=v.product.id");
                    secondQuery.add("v.option.id=" + entry.getKey());
                    secondQuery.add("v.value=" + "'" + entry.getValue() + "'");
                }
            }
            if (categoryID != null && categoryID < 0) {
                secondQuery.add("c.category.id=" + categoryID);
            }
            if (name != null && name.isEmpty()) {
                secondQuery.add("c.name LIKE  " + "'%" + name + "%'");
            }
            if (minPrice != null && minPrice > 0) {
                secondQuery.add("c.price>" + minPrice);
            }
            if (maxPrice != null && maxPrice > 0) {
                secondQuery.add("c.price<" + maxPrice);
            }
            String joinedQueries = secondQuery.stream().collect(Collectors.joining(" AND "));
            List<Product> products = manager.createQuery("SELECT p FROM Product AS p "
                    + joinedQueries, Product.class).getResultList();
            print(products);
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public static void print(List<Product> list) {
        System.out.println("Результат:");
        list.stream().map(product -> product.getId() + "-" + product.getName() + " $" + product.getPrice()).forEach(System.out::println);
    }
}