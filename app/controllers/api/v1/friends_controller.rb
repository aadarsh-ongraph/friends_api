class Api::V1::FriendsController < ApplicationController 

    def index 
        friends = Friend.all

        if friends 
            render json: {status: "Success", message:"Fetch the all friends successfully", data: friends}, status: :ok
        else  
            render json: friends.errors, status: :bad_request
        end 

    end

    def create 
        friend = Friend.new(friend_params)

        if friend.save 
            render json: {status: "Success", message:"Friend was created successfully", data: friend}, status: :created
        else   
            render json: friends.errors, status: :unprocessable_entity
        end
    end

    def show 
        friend = Friend.find(params[:id])

        if friend
            render json: {data: friend}, status: :ok
        else 
            render json: {message: "Friend could not be find"}, status: :bad_request
        end

    end 

    def destroy 
        friend = Friend.find(params[:id])

        if friend.destroy!
            render json: {message: "Friend was deleted succesfully"}, status: :ok
        else 
            render json: {message: "Friend does not exist"}, status: :bad_request
        end

    end

    def update 
        friend = Friend.find(params[:id])

        if friend.update!(friend_params)
            render json: {message: "Friend was update successfully", data: friend}, status: :ok 
        else 
            render json: {meassage: "Friend cannot updated"}, status: :unprocessable_entity
        end
    end

    private 
    def friend_params 
        params.require(:friend).permit(:name, :location, :email, :twitter, :phone)
    end

end