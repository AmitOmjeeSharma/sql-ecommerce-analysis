# 📊 Analysis Report – SQL E-Commerce Analysis

## Methodology
1. **Data Cleaning**
   - Removed rows with null CustomerIDs.  
   - Excluded cancellations (Invoice starting with 'C').  
   - Excluded negative/zero prices from revenue calculations.  
   - De-duplicated transactions (Invoice + StockCode).  

2. **SQL Queries Performed**
   - Revenue analysis (yearly, monthly).  
   - Product analysis (top revenue generators, most returned items).  
   - Customer analysis (Top customers, AOV, CLV).  
   - Returns & cancellations summary.  
   - Geographic revenue & cancellation rate by country.  
   - Year-to-year revenue growth.  

---

## Results

### 1. Revenue Analysis
- **2009–2010 Revenue**: £10.3M  
- **2010–2011 Revenue**: £10.7M  
- **Growth**: +3.5%  

Monthly revenue (2009–2010):  
- Peak: **Nov–Dec (£1.47M in Nov 2010)**  
- Low: **Feb 2010 (£553k)**  

### 2. Product Analysis
- Top products by revenue: *Cake Stand*, *T-Light Holder*, *Party Bunting*.  
- Most returned items: *Cake Stand*, *Ceramic Trinket Box*, *Lights*.  

### 3. Customer Analysis
- Top customer spent **£280k in 2010**.  
- AOV: £459 → £481.  
- CLV: some customers >£600k total spend.  

### 4. Returns & Cancellations
- Return Rate: 2.35% → 1.96%.  
- Cancellation Rate: 15.9% → 14.8%.  

### 5. Geographic Analysis
- EIRE & Netherlands: consistently strong markets.  
- Germany: high cancellations (32% in 2009, 24% in 2010).  

---

## Conclusion
The retailer shows **healthy growth** with strong customer loyalty, but must **reduce cancellations and returns** to unlock full potential.  
Strategic focus on **EU markets and product quality control** can further accelerate growth.
