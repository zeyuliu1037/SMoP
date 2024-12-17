import matplotlib.pyplot as plt
import pandas as pd

# Data from the image
data = {
    "Learning rate": [0.3, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005, 0.0001],
    "LoRA r=8 alpha=8": [43, 45, 45, 45, 62, 63, 63, 60],
    "LoRA r=8 alpha=16": [45, 55, 55, 56, 66, 63, 63, 57],
    "SMoP": [50, 56, 58, 55, 44, 56, 45, 52],
    "LoRA + SMoP": [54, 53, 44, 57, 54, 50, 51, 54]
}

# Creating a DataFrame
df = pd.DataFrame(data)
# ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', 
# '#9467bd', '#8c564b', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf']
colors = ['#d62728', 'fuchsia', '#2ca02c', 'goldenrod']
# Plotting the data
plt.figure(figsize=(10, 6))
for column in df.columns[1:]:
    plt.plot(df.index, df[column], marker='o', label=column, color=colors.pop(0))

plt.xticks(df.index, df["Learning rate"])
plt.xlabel("Learning rate", fontsize=12)
plt.ylabel("Accuracy (%)", fontsize=12)
plt.title("Performance Comparison on Copa task", fontsize=14)
plt.legend(title="Configurations", fontsize=10)
plt.grid(True)
plt.savefig("performance_comparison.png", dpi=300)
plt.show()
# cp *.png /mnt/d/download/CSCI662_HW2