CREATE TABLE "Doctors"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "Medical Center" BIGINT NOT NULL
);
ALTER TABLE
    "Doctors" ADD PRIMARY KEY("id");
CREATE TABLE "Patients_Diseases"(
    "id" SERIAL NOT NULL,
    "patient_id" BIGINT NOT NULL,
    "disease_id" BIGINT NOT NULL
);
ALTER TABLE
    "Patients_Diseases" ADD PRIMARY KEY("id");
CREATE TABLE "Patients"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "primary_doctor" BIGINT NOT NULL
);
ALTER TABLE
    "Patients" ADD PRIMARY KEY("id");
CREATE TABLE "Doctor_Patient"(
    "doctor_id" SERIAL NOT NULL,
    "patient_id" BIGINT NOT NULL,
    "id" BIGINT NOT NULL
);
ALTER TABLE
    "Doctor_Patient" ADD PRIMARY KEY("id");
CREATE TABLE "Medical_Center"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "Medical_Center" ADD PRIMARY KEY("id");
CREATE TABLE "Diseases"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "Diseases" ADD PRIMARY KEY("id");
ALTER TABLE
    "Patients_Diseases" ADD CONSTRAINT "patients_diseases_disease_id_foreign" FOREIGN KEY("disease_id") REFERENCES "Diseases"("id");
ALTER TABLE
    "Patients_Diseases" ADD CONSTRAINT "patients_diseases_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "Patients"("id");
ALTER TABLE
    "Doctor_Patient" ADD CONSTRAINT "doctor_patient_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "Patients"("id");
ALTER TABLE
    "Doctors" ADD CONSTRAINT "doctors_medical center_foreign" FOREIGN KEY("Medical Center") REFERENCES "Medical_Center"("id");
ALTER TABLE
    "Doctor_Patient" ADD CONSTRAINT "doctor_patient_doctor_id_foreign" FOREIGN KEY("doctor_id") REFERENCES "Doctors"("id");