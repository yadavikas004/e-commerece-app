
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Computer Keyboards', 'Keyboards');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Computer Monitors', 'Monitors');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Display Screens', 'Screens');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Computer Mice', 'Mice');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Computer Accessories', 'Accessories');
-- Insert more categories
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Laptops and Notebooks', 'Laptops');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Tablets and eReaders', 'Tablets');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Smartphones and Accessories', 'Smartphones');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Networking Devices', 'Networking');
INSERT INTO category (id, description, name) VALUES (nextval('category_seq'), 'Storage Devices', 'Storage');



-- Assuming you already have a sequence named 'product_seq'

-- Insert products for the 'Keyboards' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 10, 'Mechanical keyboard with RGB lighting', 'Mechanical Keyboard 1', 99.99, (SELECT id FROM category WHERE name = 'Keyboards')),
    (nextval('product_seq'), 15, 'Wireless compact keyboard', 'Wireless Compact Keyboard 1', 79.99, (SELECT id FROM category WHERE name = 'Keyboards')),
    (nextval('product_seq'), 20, 'Backlit gaming keyboard with customizable keys', 'Gaming Keyboard 1', 129.99, (SELECT id FROM category WHERE name = 'Keyboards')),
    (nextval('product_seq'), 25, 'Mechanical keyboard with wrist rest', 'Ergonomic Keyboard 1', 109.99, (SELECT id FROM category WHERE name = 'Keyboards')),
    (nextval('product_seq'), 18, 'Wireless keyboard and mouse combo', 'Wireless Combo 1', 69.99, (SELECT id FROM category WHERE name = 'Keyboards'));

-- Insert products for the 'Monitors' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, '27-inch IPS monitor with 4K resolution', '4K Monitor 1', 399.99, (SELECT id FROM category WHERE name = 'Monitors')),
    (nextval('product_seq'), 25, 'Ultra-wide gaming monitor with HDR support', 'Ultra-wide Gaming Monitor 1', 499.99, (SELECT id FROM category WHERE name = 'Monitors')),
    (nextval('product_seq'), 22, '24-inch LED monitor for office use', 'Office Monitor 1', 179.99, (SELECT id FROM category WHERE name = 'Monitors')),
    (nextval('product_seq'), 28, '32-inch curved monitor with AMD FreeSync', 'Curved Monitor 1', 329.99, (SELECT id FROM category WHERE name = 'Monitors')),
    (nextval('product_seq'), 35, 'Portable USB-C monitor for laptops', 'Portable Monitor 1', 249.99, (SELECT id FROM category WHERE name = 'Monitors'));

-- Insert products for the 'Screens' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 15, 'Curved OLED gaming screen with 240Hz refresh rate', 'Curved OLED Gaming Screen 1', 799.99, (SELECT id FROM category WHERE name = 'Screens')),
    (nextval('product_seq'), 18, 'Flat QLED monitor with 1440p resolution', 'QLED Monitor 1', 599.99, (SELECT id FROM category WHERE name = 'Screens')),
    (nextval('product_seq'), 22, '27-inch touch screen display for creative work', 'Touch Screen Display 1', 699.99, (SELECT id FROM category WHERE name = 'Screens')),
    (nextval('product_seq'), 20, 'Ultra-slim 4K HDR display for multimedia', 'Ultra-slim 4K HDR Display 1', 449.99, (SELECT id FROM category WHERE name = 'Screens')),
    (nextval('product_seq'), 25, 'Gaming projector with low input lag', 'Gaming Projector 1', 899.99, (SELECT id FROM category WHERE name = 'Screens'));

-- Insert products for the 'Mice' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, 'Wireless gaming mouse with customizable RGB lighting', 'RGB Gaming Mouse 1', 59.99, (SELECT id FROM category WHERE name = 'Mice')),
    (nextval('product_seq'), 28, 'Ergonomic wired mouse for productivity', 'Ergonomic Wired Mouse 1', 29.99, (SELECT id FROM category WHERE name = 'Mice')),
    (nextval('product_seq'), 32, 'Ambidextrous gaming mouse with high DPI', 'Ambidextrous Gaming Mouse 1', 69.99, (SELECT id FROM category WHERE name = 'Mice')),
    (nextval('product_seq'), 26, 'Travel-sized compact mouse for laptops', 'Travel Mouse 1', 19.99, (SELECT id FROM category WHERE name = 'Mice')),
    (nextval('product_seq'), 35, 'Vertical ergonomic mouse for reduced strain', 'Vertical Ergonomic Mouse 1', 39.99, (SELECT id FROM category WHERE name = 'Mice'));

-- Insert products for the 'Accessories' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 25, 'Adjustable laptop stand with cooling fan', 'Adjustable Laptop Stand 1', 34.99, (SELECT id FROM category WHERE name = 'Accessories')),
    (nextval('product_seq'), 20, 'Wireless charging pad for smartphones', 'Wireless Charging Pad 1', 24.99, (SELECT id FROM category WHERE name = 'Accessories')),
    (nextval('product_seq'), 28, 'Gaming headset stand with RGB lighting', 'RGB Headset Stand 1', 49.99, (SELECT id FROM category WHERE name = 'Accessories')),
    (nextval('product_seq'), 22, 'Bluetooth mechanical keypad for tablets', 'Bluetooth Keypad 1', 39.99, (SELECT id FROM category WHERE name = 'Accessories')),
    (nextval('product_seq'), 30, 'External hard drive enclosure with USB-C', 'External Hard Drive Enclosure 1', 29.99, (SELECT id FROM category WHERE name = 'Accessories'));

-- Insert products for the 'Laptops' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 20, '14-inch ultra-thin laptop with Intel i5 processor', 'Ultra-thin Laptop 1', 899.99, (SELECT id FROM category WHERE name = 'Laptops')),
    (nextval('product_seq'), 15, '15.6-inch gaming laptop with Nvidia GTX 1660', 'Gaming Laptop 1', 1299.99, (SELECT id FROM category WHERE name = 'Laptops')),
    (nextval('product_seq'), 18, '13-inch lightweight laptop for students', 'Student Laptop 1', 699.99, (SELECT id FROM category WHERE name = 'Laptops')),
    (nextval('product_seq'), 22, '17-inch laptop with 4K display', '4K Laptop 1', 1499.99, (SELECT id FROM category WHERE name = 'Laptops')),
    (nextval('product_seq'), 25, '2-in-1 convertible laptop with touchscreen', 'Convertible Laptop 1', 1099.99, (SELECT id FROM category WHERE name = 'Laptops'));

-- Insert products for the 'Tablets' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 30, '10-inch tablet with detachable keyboard', 'Tablet with Keyboard 1', 499.99, (SELECT id FROM category WHERE name = 'Tablets')),
    (nextval('product_seq'), 28, '8-inch budget tablet with Android OS', 'Budget Tablet 1', 199.99, (SELECT id FROM category WHERE name = 'Tablets')),
    (nextval('product_seq'), 25, '12.9-inch high-end tablet with Apple iOS', 'High-end Tablet 1', 999.99, (SELECT id FROM category WHERE name = 'Tablets')),
    (nextval('product_seq'), 22, '10-inch tablet with stylus support', 'Stylus Tablet 1', 549.99, (SELECT id FROM category WHERE name = 'Tablets')),
    (nextval('product_seq'), 35, '7-inch eReader with e-ink display', 'eReader 1', 129.99, (SELECT id FROM category WHERE name = 'Tablets'));

-- Insert products for the 'Smartphones' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 40, 'Flagship smartphone with 5G support', 'Flagship Smartphone 1', 999.99, (SELECT id FROM category WHERE name = 'Smartphones')),
    (nextval('product_seq'), 35, 'Mid-range smartphone with dual cameras', 'Mid-range Smartphone 1', 499.99, (SELECT id FROM category WHERE name = 'Smartphones')),
    (nextval('product_seq'), 50, 'Budget smartphone with large battery', 'Budget Smartphone 1', 299.99, (SELECT id FROM category WHERE name = 'Smartphones')),
    (nextval('product_seq'), 45, 'Foldable smartphone with flexible display', 'Foldable Smartphone 1', 1499.99, (SELECT id FROM category WHERE name = 'Smartphones')),
    (nextval('product_seq'), 30, 'Smartphone case with shock protection', 'Smartphone Case 1', 29.99, (SELECT id FROM category WHERE name = 'Smartphones'));

-- Insert products for the 'Networking' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 50, 'Dual-band Wi-Fi router with 1200 Mbps speed', 'Wi-Fi Router 1', 89.99, (SELECT id FROM category WHERE name = 'Networking')),
    (nextval('product_seq'), 45, 'Mesh Wi-Fi system for large homes', 'Mesh Wi-Fi System 1', 199.99, (SELECT id FROM category WHERE name = 'Networking')),
    (nextval('product_seq'), 40, 'Gigabit Ethernet switch with 8 ports', 'Ethernet Switch 1', 49.99, (SELECT id FROM category WHERE name = 'Networking')),
    (nextval('product_seq'), 55, 'USB Wi-Fi adapter for desktop PCs', 'USB Wi-Fi Adapter 1', 29.99, (SELECT id FROM category WHERE name = 'Networking')),
    (nextval('product_seq'), 35, 'Powerline network adapter kit', 'Powerline Adapter Kit 1', 79.99, (SELECT id FROM category WHERE name = 'Networking'));

-- Insert products for the 'Storage' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 60, '1TB external SSD with USB 3.1', 'External SSD 1', 149.99, (SELECT id FROM category WHERE name = 'Storage')),
    (nextval('product_seq'), 55, '2TB portable hard drive with USB-C', 'Portable Hard Drive 1', 99.99, (SELECT id FROM category WHERE name = 'Storage')),
    (nextval('product_seq'), 50, '128GB microSD card with adapter', 'MicroSD Card 1', 29.99, (SELECT id FROM category WHERE name = 'Storage')),
    (nextval('product_seq'), 65, 'Network-attached storage (NAS) device', 'NAS Device 1', 399.99, (SELECT id FROM category WHERE name = 'Storage')),
    (nextval('product_seq'), 45, 'USB flash drive with 256GB capacity', 'USB Flash Drive 1', 59.99, (SELECT id FROM category WHERE name = 'Storage'));