data("ToothGrowth", package = "datasets")
head(ToothGrowth)

DatasetName <- within(ToothGrowth, {
  x        <- dose          
  y        <- len           
  z        <- len           
  group    <- supp          
  category <- supp          
})

# Scatter plot
plot(DatasetName$x, DatasetName$y,
     main = "Base: x vs. y (Dose vs Tooth Length)",
     xlab = "Dose (mg/day)",
     ylab = "Tooth Length",
     pch = 19, col = "steelblue")

# Histogram
hist(DatasetName$z,
     main = "Base: Distribution of z (Tooth Length)",
     xlab = "Tooth Length",
     col = "gray85", border = "white")

library(lattice)

# Conditional scatter plot (small multiples)
xyplot(y ~ x | factor(group),
       data = DatasetName,
       main = "Lattice: y vs. x by group (Tooth Length vs Dose by Supplement)",
       xlab = "Dose (mg/day)", ylab = "Tooth Length",
       pch = 16, col = "tomato", layout = c(2,1))

# Box-and-whisker plot
bwplot(z ~ factor(category),
       data = DatasetName,
       main = "Lattice: z by category (Tooth Length by Supplement)",
       xlab = "Supplement", ylab = "Tooth Length",
       fill = "lightblue")


library(ggplot2)

# Scatter plot with smoothing
ggplot(DatasetName, aes(x = x, y = y, color = factor(group))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: y vs. x with trend by group (Tooth Length vs Dose)",
       x = "Dose (mg/day)", y = "Tooth Length",
       color = "Supplement")

# Faceted histogram
ggplot(DatasetName, aes(z)) +
  geom_histogram(binwidth = 2) +
  facet_wrap(~ category) +
  labs(title = "ggplot2: z distribution by category (Tooth Length by Supplement)",
       x = "Tooth Length", y = "Count")


Output of R 
> data("ToothGrowth", package = "datasets")
> head(ToothGrowth)
   len supp dose
1  4.2   VC  0.5
2 11.5   VC  0.5
3  7.3   VC  0.5
4  5.8   VC  0.5
5  6.4   VC  0.5
6 10.0   VC  0.5
> DatasetName <- within(ToothGrowth, {
+   x        <- dose          
+   y        <- len           
+   z        <- len           
+   group    <- supp          
+   category <- supp          
+ })
> plot(DatasetName$x, DatasetName$y,
+      main = "Base: x vs. y (Dose vs Tooth Length)",
+      xlab = "Dose (mg/day)",
+      ylab = "Tooth Length",
+      pch = 19, col = "steelblue")
> plot(DatasetName$x, DatasetName$y,
+      main = "Base: x vs. y (Dose vs Tooth Length)",
+      xlab = "Dose (mg/day)",
+      ylab = "Tooth Length",
+      pch = 19, col = "steelblue")
> hist(DatasetName$z,
+      main = "Base: Distribution of z (Tooth Length)",
+      xlab = "Tooth Length",
+      col = "gray85", border = "white")
> library(lattice)
> xyplot(y ~ x | factor(group),
+        data = DatasetName,
+        main = "Lattice: y vs. x by group (Tooth Length vs Dose by Supplement)",
+        xlab = "Dose (mg/day)", ylab = "Tooth Length",
+        pch = 16, col = "tomato", layout = c(2,1))
> bwplot(z ~ factor(category),
+        data = DatasetName,
+        main = "Lattice: z by category (Tooth Length by Supplement)",
+        xlab = "Supplement", ylab = "Tooth Length",
+        fill = "lightblue")
> library(ggplot2)
> ggplot(DatasetName, aes(x = x, y = y, color = factor(group))) +
+   geom_point() +
+   geom_smooth(method = "lm", se = FALSE) +
+   labs(title = "ggplot2: y vs. x with trend by group (Tooth Length vs Dose)",
+        x = "Dose (mg/day)", y = "Tooth Length",
+        color = "Supplement")
`geom_smooth()` using formula = 'y ~ x'
> ggplot(DatasetName, aes(z)) +
+   geom_histogram(binwidth = 2) +
+   facet_wrap(~ category) +
+   labs(title = "ggplot2: z distribution by category (Tooth Length by Supplement)",
+        x = "Tooth Length", y = "Count")

 # How does the syntax and workflow differ between base, lattice, and ggplot2?

You call plot() and hist() in Base R and specify labels, colors, and other things by yourself.Lattice has a formula interface (y ~ x | group) that makes tiny multiples simple to construct without having to write 
loops by hand.ggplot2 employs a layered syntax that is consistent and may be added to across plots.The layers include data, aesthetics, geoms, and facets.

# Which system gave you the most control or produced the most “publication‑quality” output with minimal code?
Layering (geom_point() + geom_smooth()) and consistent theming in ggplot2 provide professional pictures rapidly.Lattice is an excellent way to create conditioned views with very little code.
Base is the quickest rapid inspections, but it requires more manual styling to look goodfor publishing.

# Any challenges or surprises you encountered when switching between systems
The mental model evolves every time:  Base is easy to use right away, but you have to do it by hand. Lattice's formula syntax is short but not very versatile for custom layers.
ggplot2 is quite flexible, but you have to understand its language. A good surprise: it's much easier to facet and condition in Lattice with ggplot2 than it is to write scripts for multi-panel Base plots.


Blogger link  -
https://r-rstudio-installation.blogspot.com/2025/10/module-9-assignment.html










