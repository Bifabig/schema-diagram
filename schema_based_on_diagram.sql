CREATE TABLE invoices (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at DATE NOT NULL,
    payed_at DATE NOT NULL,
    medical_history_id INT,
);

CREATE TABLE medical_histories (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    admitted_at DATE NOT NULL,
    patient_id INT,
    status VARCHAR(100) NOT NULL,
);

ALTER TABLE invoices
ADD CONSTRAINT fk_medical_histories
FOREIGN KEY (medical_history_id)
REFERENCES medical_histories (id); 

CREATE TABLE invoice_items (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
);

ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoices
FOREIGN KEY (invoice_id)
REFERENCES invoices (id); 

CREATE TABLE treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
);

CREATE TABLE patients (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
);

ALTER TABLE invoice_items
ADD CONSTRAINT fk_treatments
FOREIGN KEY (treatment_id)
REFERENCES treatments (id);

CREATE TABLE medical_histories_and_treatments (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    medical_history_id INT,
    treatment_id INT
);

ALTER TABLE medical_histories_and_treatments
ADD CONSTRAINT fk_medical_histories
FOREIGN KEY (medical_history_id)
REFERENCES medical_histories (id);

ALTER TABLE medical_histories_and_treatments
ADD CONSTRAINT fk_treatments
FOREIGN KEY (treatment_id)
REFERENCES treatments (id);