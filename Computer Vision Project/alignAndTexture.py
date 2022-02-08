import numpy as np
import open3d as o3d
import cv2
from PIL import Image
import matplotlib.pyplot as plt
from glob import glob 
import os
import time
import copy


def draw_registration_result(source, target, transformation):
	source_temp = copy.deepcopy(source)
	target_temp = copy.deepcopy(target)
	source_temp.transform(transformation)
	#o3d.visualization.draw_geometries([source_temp, target_temp])
	temp=(source_temp+target_temp).voxel_down_sample(voxel_size=0.03)
	return temp

path_color="entrada2/color/"
path_depth="entrada2/depth/"
names_color = sorted([os.path.basename(x) for x in glob(path_color+'*.jpg')],key=lambda x:int(x.split('.')[0]))
names_depth = sorted([os.path.basename(x) for x in glob(path_depth+'*.png')],key=lambda x:int(x.split('.')[0]))
#print(names_color)
#print(names_depth)


Axes = o3d.geometry.TriangleMesh.create_coordinate_frame(1)


with np.load ('kinect params.npz') as data :
	intrinsics = data['camera_matrix']
	#distortion = data['dist_coefs']
#print('Intrinsics:')
#print ( intrinsics )
#print('Distortion:')
#print ( distortion )

def flatten(t):
    return [item for sublist in t for item in sublist]

intrinsic = flatten(intrinsics.tolist())
intrinsic = o3d.camera.PinholeCameraIntrinsic(1920,1080,fx = intrinsic[0], fy = intrinsic[4], cx = intrinsic[2], cy = intrinsic[5])


rgbd_image=[]
for foto in range(len(names_color)):
    color = o3d.io.read_image(path_color+str(names_color[foto]))
    #color = cv2.undistort(color, intrinsics, distortion)
    #color= o3d.io.read_image(color)
    depth = o3d.io.read_image(path_depth+str(names_depth[foto]))
    rgbd_image.append(o3d.geometry.RGBDImage.create_from_color_and_depth(color, depth,convert_rgb_to_intensity = False))

clouds=[]

for j in range(len(rgbd_image)):
	target_pcd = o3d.geometry.PointCloud.create_from_rgbd_image(rgbd_image[j], intrinsic).voxel_down_sample(voxel_size=0.05)
	target_pcd.transform([[1, 0, 0, 0], [0, -1, 0, 0], [0, 0, -1, 0], [0, 0, 0, 1]])
	clouds.append(target_pcd)


vis=o3d.visualization.Visualizer()
vis.create_window()

#o3d.visualization.draw_geometries([clouds[0]])

new_cloud=clouds[0]
count=0
threshold = 0.1
trans_init = np.identity(4)*0.1
for u in range(len(rgbd_image)-1):
	print("Apply point-to-point ICP")
	source_down = new_cloud.voxel_down_sample(0.005)
	target_down = clouds[u+1].voxel_down_sample(0.005)
	print("Estimate normal")
	source_down.estimate_normals(
        o3d.geometry.KDTreeSearchParamHybrid(radius=0.2, max_nn=30))
	target_down.estimate_normals(
        o3d.geometry.KDTreeSearchParamHybrid(radius=0.2, max_nn=30))
	

	reg_p2p = o3d.pipelines.registration.registration_icp(
    source_down, target_down, threshold, trans_init,
    o3d.pipelines.registration.TransformationEstimationPointToPlane())

	#print(reg_p2p)
	#print("Transformation is:")
	print(reg_p2p.transformation)
	trans_init=trans_init+reg_p2p.transformation
	new_cloud=draw_registration_result(source_down, target_down, reg_p2p.transformation)
	vis.add_geometry(new_cloud)
	vis.poll_events()
	#vis.capture_screen_image("cloudpoints4/point"+str(count)+".png")
	vis.update_renderer()
	vis.clear_geometries()
	count+=1
	print(count)
	time.sleep(0.5)

vis.destroy_window()

o3d.visualization.draw_geometries([new_cloud])

'''distances = new_cloud.compute_nearest_neighbor_distance()
avg_dist = np.mean(distances)
p#rint(avg_dist)
radius = 3 * avg_dist   

#radii=[0.5, 0.5, 0.5, 0.5]
radii =[radius, radius * 2, radius*0.05]
mesh = o3d.geometry.TriangleMesh.create_from_point_cloud_ball_pivoting(new_cloud, o3d.utility.DoubleVector(radii))
o3d.visualization.draw_geometries([mesh])'''

alpha = 0.1
mesh = o3d.geometry.TriangleMesh.create_from_point_cloud_alpha_shape(new_cloud, alpha)
mesh.compute_vertex_normals()
o3d.visualization.draw_geometries([mesh], mesh_show_back_face=True)

