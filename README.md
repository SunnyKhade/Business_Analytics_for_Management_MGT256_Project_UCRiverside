# 🚚 The Road to Better Deliveries: Pruning Lead Time  

## 📌 Project Overview  
This project predicts and minimizes **delivery lead time** in logistics using data-driven techniques.  
By applying preprocessing, feature engineering, and machine learning models (Linear Regression, KNN),  
we identify the key factors influencing delivery efficiency.  

**Course:** MGT 256 – Business Analytics (University of California, Riverside)
**Team:** Group 9 (Sunny Khade, Nidhi Verhani, Gunjan Kale, Dev Kotian, Parv Maru)  

---

## 🎯 Research Problem  
Can we accurately **predict delivery lead time** in order to minimize it and improve logistics efficiency?  

Why it matters:  
- Improve customer satisfaction & loyalty  
- Gain competitive advantage  
- Reduce costs & optimize inventory  
- Enhance overall operational efficiency  

---

## 📊 Dataset  
- **File:** `Dataset_logistics.csv`  
- **Observations:** 1,010 shipments  
- **Variables:** Distance, transport mode, shipment urgency, weather, fuel price, stops, customs clearance,  
  carrier reliability, supply chain disruption, product type, packaging type, etc.  
- **Dictionary:** `data_dictionary_logistics.csv`  

---

## 🔧 Methodology  
1. **Data Preprocessing**  
   - Removed nulls & outliers (IQR)  
   - Dropped irrelevant columns (`id`, `factory_location`, `destination`)  
   - Converted categorical variables into dummy variables  

2. **Feature Selection**  
   - Best Subset Selection & Forward Selection → 13 key predictors  

3. **Modeling**  
   - **Linear Regression:** Adjusted R² = 0.9323, RMSE = 0.542  
   - **KNN (k=7):** RMSE = 1.131  

4. **Model Selection**  
   - Linear Regression chosen for best accuracy & interpretability  

---

## 📂 Repository Contents  
- `Dataset_logistics.csv` → Cleaned dataset  
- `data_dictionary_logistics.csv` → Dataset variable dictionary  
- `R_Code.R` → R script (preprocessing, feature selection, modeling)  
- `Project_Report.pdf` → Detailed report  
- `Project_Abstract.pdf` → Summary abstract  
- `Final_Presentation.pdf` & `Presentation_1.pdf` → Project slides  
- `README.md` → Documentation  

---

## 📈 Results  
- **Best Model:** Linear Regression  
- **Performance:** Adjusted R² = 0.9323, RMSE = 0.542  
- **Key Drivers of Lead Time:** Distance, stops, weather, customs clearance, urgency, supply chain disruptions  

---

## 🚀 Future Work  
- Explore ensemble methods (Random Forest, Gradient Boosting)  
- Add external variables (traffic, live weather feeds)  
- Build an interactive decision-support dashboard  

---

## 👨‍💻 Tools & Technologies  
- **Language:** R  
- **Techniques:** Regression, KNN, Feature Selection (Best Subset, Forward)  
- **Libraries:** `stats`, `caret`, `ggplot2`  

---
📌 *A portfolio project showcasing how data analytics can optimize logistics operations and improve efficiency.*
