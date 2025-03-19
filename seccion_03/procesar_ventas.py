import pandas as pd

# Leer el archivo CSV
df = pd.read_csv('datos_ventas.csv')

# Calcular el total de ventas por producto (cantidad * precio_unitario)
df['total_ventas'] = df['cantidad'] * df['precio_unitario']
resumen_ventas = df.groupby('producto')['total_ventas'].sum().reset_index()

# Guardar el resumen en un nuevo archivo CSV
resumen_ventas.to_csv('resumen_ventas.csv', index=False)

print("Resumen de ventas guardado en 'resumen_ventas.csv'")
