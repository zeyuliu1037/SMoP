import matplotlib.pyplot as plt
import pandas as pd

# Data from the new image
data2 = {
    "Learning rate": [0.5, 0.3, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005, 0.0001],
    "LoRA + SMoP": [66, 68, 64, 62, 63, 65, 66, 56, 61],
    "LoRA + P-tuning": [59, 66, 65, 62, 64, 59, 67, 63, 58],
    "LoRA + Prompt Tuning": [53, 64, 57, 62, 61, 55, 60, 56, 58]
}

# Creating a DataFrame for the new data
df2 = pd.DataFrame(data2)
colors = ['goldenrod', 'aqua', 'violet']
# Plotting the new data
plt.figure(figsize=(10, 6))
for column in df2.columns[1:]:
    plt.plot(df2.index, df2[column], marker='o', label=column, color=colors.pop(0))

plt.xticks(df2.index, df2["Learning rate"])
plt.xlabel("Learning rate", fontsize=12)
plt.ylabel("Accuracy (%)", fontsize=12)
plt.title("Performance Comparison of LoRA + Tuning Methods on Copa task", fontsize=14)
plt.legend(title="Methods", fontsize=10)
plt.grid(True)
plt.savefig("performance_comparison2.png", dpi=300)
plt.show()
